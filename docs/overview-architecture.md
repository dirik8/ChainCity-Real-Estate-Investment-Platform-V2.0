## Overview & Architecture

- Framework: Laravel 11 (PHP ^8.1)
- Key domains: Users/Admins, Properties & Investments, Wallet (Funds, Transactions, Payouts), Offers/Share Market, Referrals & Ranks, Content CMS & Blog, Notifications (Email/SMS/In-App/Push)
- Layers:
  - HTTP: Controllers under `app/Http/Controllers` for Web, API, Admin
  - Domain: Eloquent models in `app/Models`
  - Services: `app/Services/*` (payments, localization, notify)
  - Jobs & Schedules: `app/Jobs/*`, scheduled in `app/Console/Kernel.php`
  - Views: Blade templates under `resources/views`
  - Config: `config/*` (payments, notifications, plugins, languages, theme)

### Notable Features
- Auth: Laravel UI + Sanctum API, Socialite login
- KYC: User KYC submission and admin review
- Two-factor: Google 2FA
- Investments: Fixed/instalment, due payments, analytics
- Share market: Offers, locks, replies, payment confirmation
- Wallet: deposits (many gateways), transfers, payouts
- Referral & Rank: Multi-level bonuses; admin rank configuration
- CMS: Pages, contents, menu, themes, blog with SEO
- Notifications: Email, SMS, in-app via Pusher, push via Firebase

### Routing
- Web routes: `routes/web.php`
- API routes: `routes/api.php` (Sanctum protected groups)
- Admin routes: `routes/admin.php` with `admin_prefix`

### Schedules & Jobs
- Daily: `main:cron`, `badge:cron`, `UpdatePropertyJob`
- Conditional: crypto/fiat currency updates; BlockIo IPN, Binance payout status

### Storage & Assets
- Storage: file storage configuration via admin panel; uploads under `assets/upload/*`
- Front-end assets in `resources` and compiled assets in `assets`
