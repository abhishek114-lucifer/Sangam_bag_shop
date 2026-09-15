# Sangam Bag Shop — Supabase + Vercel

This version keeps the existing cinematic UI and moves data operations from the local Python/MySQL server to Supabase REST API.

## Current database
- `products`: 58 catalogue products
- `sales`: sales history
- 20% customer discount remains calculated in JavaScript
- DSA examples remain in JavaScript: hash table, linear search, bubble sort

## Deploy to Vercel
1. Upload this folder to GitHub.
2. In Vercel, import the GitHub repository.
3. Framework Preset: Other (or leave detected as static).
4. Build Command: leave empty.
5. Output Directory: `.`
6. Deploy.

The Supabase URL and publishable/anon key are in `static/supabase-config.js`.
Do not replace the publishable/anon key with a Supabase secret/service-role key.

## Important security note
The current Supabase RLS policies were created as simple anonymous CRUD policies for this deployment test. Before using this as a real public shop system, add Supabase Auth and restrict write/delete access to authenticated shop users.
