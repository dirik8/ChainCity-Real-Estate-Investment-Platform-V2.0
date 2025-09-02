## Project: Real Estate Fractional Investment Platform

Modern Laravel 11 application for property investment, secondary share trading, wallet funding, payouts, rank and referral programs, support tickets, multilingual pages, and real-time notifications. Exposes a full REST API and a role-based admin panel.

### Highlights
- **Property market**: invest in properties, create/list shares, send/accept/reject offers, secure payment lock/confirm
- **Wallet & payments**: deposits, multi-gateway IPN, transactions, KYC, payouts (auto/manual)
- **User experience**: wishlist, referrals, rankings, reviews, 2FA, notifications (FCM + Pusher)
- **CMS**: dynamic pages, blog, menus, languages, SEO
- **Admin**: users, roles/permissions, investments lifecycle, payment/payout logs, KYC, content, settings
- **API**: Laravel Sanctum-protected endpoints for mobile/SPA

## Tech Stack
- **Backend**: PHP 8.1+, Laravel 11, Sanctum, Eloquent, Validation, Queue, Scheduler
- **Payments**: Stripe, Razorpay, Mollie, Flutterwave, Paystack, Midtrans, CoinGate, CinetPay, Authorize.Net
- **Comms**: Mailersend/Mailgun/Sendgrid/SES, Twilio/Infobip/Plivo/Vonage SMS
- **Realtime/Push**: Pusher Channels, Firebase Cloud Messaging
- **Frontend**: Vite, Bootstrap 5, Sass, Axios

## Quick Start
1) Clone and install dependencies
```bash
composer install
npm install
```
2) Configure environment
```bash
cp .env.example .env
php artisan key:generate
# Set DB_*, APP_URL, MAIL_*, SMS_*, PUSHER_*, FIREBASE_*, GOOGLE_RECAPTCHA_*, SOCIALITE_*
```
3) Migrate and seed
```bash
php artisan migrate --seed
```
4) Run dev servers
```bash
php artisan serve
npm run dev
```

### Admin Panel
- Default path: `/admin` (prefix configurable via `basicControl()->admin_prefix`)
- Seeded admin: `admin / admin` (change after first login)

### Queues & Scheduler
- Queue worker: `php artisan queue:work`
- Scheduler (cron): `* * * * * php /path/to/artisan schedule:run >> /dev/null 2>&1`

### Build for production
```bash
npm run build
php artisan optimize
```

## Project Structure
```
app/
  Http/Controllers/{Admin,Api,Auth,User}
  Models/ (Property, Investment, Offer, Share, Transaction, Deposit, Payout, Kyc, ...)
config/ (payments, pusher, firebase, sms, mail, languages, ...)
database/ (migrations, seeders)
resources/ (views with theme support, sass, js)
routes/ (web.php, admin.php, api.php)
```

## Documentation
- Overview: `docs/OVERVIEW.md`
- Architecture: `docs/ARCHITECTURE.md`
- Environment: `docs/ENVIRONMENT.md`
- API: `docs/API.md`
- Admin Panel: `docs/ADMIN.md`
- Web User Features: `docs/WEB_USER.md`
- Payments: `docs/PAYMENTS.md`
- Notifications: `docs/NOTIFICATIONS.md`
- Deployment: `docs/DEPLOYMENT.md`
- Database: `docs/DATABASE.md`
- Contributing: `CONTRIBUTING.md`

## Security Notes
- Do not commit secrets (e.g., Firebase service accounts). Use environment variables.
- Enable 2FA and reCAPTCHA in production.
