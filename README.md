# 🍜 Gully Bowls — Feedback Form Setup Guide

**Estimated setup time: 20 minutes. No coding needed. Just follow the steps!**

---

## 📦 What You're Building

| What | URL (after setup) |
|------|-------------------|
| Consumer Feedback Form | `https://your-app.vercel.app` |
| Admin Dashboard | `https://your-app.vercel.app/admin.html` |

---

## 🗺️ OVERVIEW (What goes where)

```
SUPABASE  →  stores all feedback data + dish config
GITHUB    →  holds all your files (code)
VERCEL    →  makes your files live on the internet
```

---

## STEP 1 — Set Up Supabase (Your Database) 🗄️

> Supabase is free, no credit card needed.

1. Go to **https://supabase.com** → Click **"Start your project"**
2. Sign up with Google or email
3. Click **"New Project"**
   - Name: `gully-bowls`
   - Database Password: make a strong one and **save it somewhere!**
   - Region: pick **Singapore** (closest to India)
4. Wait ~2 minutes for it to set up (there's a progress bar)
5. Once ready, click **"SQL Editor"** in the left sidebar
6. Click **"New Query"**
7. Open the file `supabase-setup.sql` from this folder, **select all text, copy it**
8. Paste it into the Supabase SQL editor → Click **"Run"** (green button, top right)
9. You should see "Success. No rows returned" — that means it worked! ✅

### Get Your Credentials
1. In Supabase, click **"Settings"** (gear icon, bottom left) → **"API"**
2. Copy **"Project URL"** — looks like `https://abcxyz.supabase.co`
3. Copy **"anon public"** key — a long string starting with `eyJ...`
4. **Save both somewhere** — you'll need them in Step 3

---

## STEP 2 — Create Your Admin Account 👤

1. In Supabase, click **"Authentication"** in the left sidebar
2. Click **"Users"** tab → Click **"Add User"** → **"Create New User"**
3. Enter **your email** and a **strong password**
4. Click **"Create User"** ✅
5. **Remember this email + password** — this is how you log into the admin dashboard

---

## STEP 3 — Fill in Your Config 🔑

1. Open the file `js/config.js` in any text editor (Notepad, TextEdit, etc.)
2. Replace the placeholder values:

```javascript
const SUPABASE_URL  = 'https://abcxyz.supabase.co';    // ← paste your Project URL here
const SUPABASE_ANON_KEY = 'eyJhbGci...long key...';    // ← paste your anon public key here
const ADMIN_EMAIL   = 'you@youremail.com';              // ← your admin email
```

3. Save the file ✅

---

## STEP 4 — Set Up GitHub 📁

> GitHub stores your files so Vercel can deploy them.

1. Go to **https://github.com** → Sign up (free)
2. Click the **"+"** icon (top right) → **"New repository"**
3. Repository name: `gully-bowls-feedback`
4. Keep it **Public**
5. Click **"Create repository"**

### Upload Your Files
1. On the new repo page, click **"uploading an existing file"**
2. You need to upload the files in this **exact folder structure**:
   ```
   gully-bowls-feedback/
   ├── index.html
   ├── admin.html
   ├── vercel.json
   ├── supabase-setup.sql
   ├── js/
   │   └── config.js
   └── assets/
       └── logo.png
   ```
3. To upload with folders, **drag the entire `gully-bowls` folder** into the GitHub upload area
   > ⚠️ If GitHub doesn't support folder drag-drop in your browser, use GitHub Desktop app (see below)
4. Write a commit message: `Initial upload`
5. Click **"Commit changes"** ✅

### Alternative: GitHub Desktop (easier for folders)
1. Download from **https://desktop.github.com**
2. Sign in → Click **"Clone a repository"** → paste your repo URL
3. Copy all your files into the cloned folder
4. In GitHub Desktop, click **"Commit to main"** → **"Push origin"**

---

## STEP 5 — Deploy on Vercel 🚀

1. Go to **https://vercel.com** → Click **"Sign Up"** → **"Continue with GitHub"**
2. Click **"New Project"**
3. Find `gully-bowls-feedback` in the list → Click **"Import"**
4. Don't change any settings — just click **"Deploy"**
5. Wait ~1 minute… 🎉
6. Vercel gives you a URL like: **`gully-bowls-feedback.vercel.app`**

---

## ✅ YOU'RE LIVE!

| Link | Purpose |
|------|---------|
| `https://gully-bowls-feedback.vercel.app` | Share this with consumers |
| `https://gully-bowls-feedback.vercel.app/admin.html` | Your admin dashboard |

---

## 🎛️ HOW TO USE THE ADMIN DASHBOARD

### Logging In
- Go to `/admin.html`
- Enter the email + password you created in Supabase (Step 2)

### Updating Today's Dish (Do this every day!)
1. Click **"Today's Dish"** tab
2. Enter the dish name
3. Add an image: either paste a URL, or upload a photo directly
4. Click **"Save Dish"** → consumers see it instantly!

### Viewing Feedback
1. Click **"Responses"** tab
2. Use the date picker to filter by date
3. Click **"Export Excel"** to download a spreadsheet for that date

### Overview Dashboard
- See total responses, today's count, average ratings
- Quick view of latest 8 responses

---

## 📲 SHARING THE FORM LINK

Share `https://your-app.vercel.app` with your testers via:
- WhatsApp/Telegram message
- QR code on the table (use any free QR generator)
- Instagram story/bio link

---

## 🔧 MAKING CHANGES LATER

### Change the dish name daily:
→ Log into admin dashboard → Today's Dish → Update → Save

### Update the app code:
→ Edit files locally → Upload to GitHub → Vercel auto-deploys!

---

## 🆘 COMMON ISSUES

| Problem | Fix |
|---------|-----|
| Form doesn't load | Check `js/config.js` — make sure URL and key are correct, no spaces |
| "Admin login failed" | Make sure you created the user in Supabase Auth (Step 2) |
| Data not saving | Re-run `supabase-setup.sql` in Supabase SQL Editor |
| Images not uploading | The storage bucket may not have been created — re-run the SQL |
| Vercel deploy failed | Check that `vercel.json` was uploaded correctly |

---

## 💰 COSTS

| Service | Free Tier |
|---------|-----------|
| Supabase | Free forever (up to 500MB, 50k monthly active users) |
| GitHub | Free forever |
| Vercel | Free forever (for personal/small projects) |
| **Total** | **₹0 / month** 🎉 |

---

## 📞 NEED HELP?

1. Check the **Common Issues** table above first
2. Supabase has great docs at **docs.supabase.com**
3. Vercel has great docs at **vercel.com/docs**

---

*Built with ❤️ for Gully Bowls — India's Healthiest Street Bowls*
