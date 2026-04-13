-- =====================================================
--  GULLY BOWLS — SUPABASE DATABASE SETUP
--  Copy this entire file and paste into:
--  Supabase Dashboard → SQL Editor → New Query → Run
-- =====================================================

-- 1. FEEDBACK TABLE (stores every consumer submission)
create table if not exists feedback (
  id                      uuid default gen_random_uuid() primary key,
  created_at              timestamptz default now(),
  submitted_date          date default current_date,
  name                    text not null,
  profession              text,
  linkedin_profile        text,
  insta_profile           text,
  dish_name               text,
  flavours                text[],
  price_range             text,
  taste_texture_rating    int check (taste_texture_rating between 1 and 5),
  first_impression_rating int check (first_impression_rating between 1 and 5),
  found_healthy           boolean,
  feedback_text           text,
  india_market_vote       boolean
);

-- 2. DISH CONFIG TABLE (admin updates this to set today's dish)
create table if not exists dish_config (
  id              int primary key default 1,
  dish_name       text not null default 'Today''s Special Bowl',
  dish_image_url  text,
  updated_at      timestamptz default now()
);

-- Insert default row (run only once)
insert into dish_config (id, dish_name)
values (1, 'Today''s Special Bowl')
on conflict (id) do nothing;

-- 3. ROW LEVEL SECURITY
alter table feedback    enable row level security;
alter table dish_config enable row level security;

-- Anon users (consumers) can INSERT feedback
create policy "public_insert_feedback"
  on feedback for insert to anon
  with check (true);

-- Anon users can READ dish config (to show dish on form)
create policy "public_read_dish_config"
  on dish_config for select to anon
  using (true);

-- Authenticated users (admin) can do everything on feedback
create policy "admin_read_feedback"
  on feedback for select to authenticated
  using (true);

create policy "admin_delete_feedback"
  on feedback for delete to authenticated
  using (true);

-- Authenticated users can manage dish config
create policy "admin_manage_dish_config"
  on dish_config for all to authenticated
  using (true)
  with check (true);

-- 4. SUPABASE STORAGE BUCKET for dish images
insert into storage.buckets (id, name, public)
values ('dish-images', 'dish-images', true)
on conflict (id) do nothing;

-- Allow anyone to view dish images
create policy "public_read_dish_images"
  on storage.objects for select to anon
  using (bucket_id = 'dish-images');

-- Allow admin to upload dish images
create policy "admin_upload_dish_images"
  on storage.objects for insert to authenticated
  with check (bucket_id = 'dish-images');

create policy "admin_update_dish_images"
  on storage.objects for update to authenticated
  using (bucket_id = 'dish-images');
