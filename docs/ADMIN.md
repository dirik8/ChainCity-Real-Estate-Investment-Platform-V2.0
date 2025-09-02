## Admin Panel

Base path: `/admin` (prefix configurable via `basicControl()->admin_prefix`).

### Authentication
- GET `/admin` login, password reset, logout
- Admin guards: `auth:admin`, permission middleware

### Dashboard & Analytics
- Charts: deposits/withdraws, users, tickets, KYC, transactions, browsers/OS/devices

### Investments
- Lists: all, running, due, expired, completed
- Actions: activate/deactivate, detail views, searches

### Properties & Wishlist
- CRUD properties, details, wishlist management

### Ranks & Referral Commission
- Manage ranks, rank bonuses
- Define referral commission rules and actions

### Users
- Search, edit, update email/username/password/preferences, two-fa, balances
- View KYC, transactions, investments, commissions, payments, payouts
- Send email to one or all users, delete user
- Login as user (impersonate)

### Payments & Payouts
- Payment methods: list/edit/update/sort/deactivate; manual methods CRUD
- Payment logs: list/pending/request; actions
- Payout methods: list/create/edit/update/activate; days setting
- Payout logs: list/pending/request; actions

### KYC
- Settings CRUD, user KYC list/view/action, search filters

### Content & CMS
- Frontend pages CRUD per theme; static page edit; SEO metadata
- Manage menus (header/footer/custom links)
- Content blocks single/multiple, translations
- Blog categories/posts, slug updates, SEO pages

### Configuration
- Basic control & activities, currency exchange API config
- Firebase config (including file upload/download), Pusher config
- Email config and test, SMS config and default selection
- Notification templates (email, SMS, in-app, push)
- Plugins: Tawk, FB Messenger, Google reCAPTCHA, Analytics
- Storage: set default disk and credentials
- Languages: CRUD, status, keywords management and translations (single/all)
- Theme manager: activate theme
- Maintenance mode toggle

### Tools
- Trigger `queue:work --stop-when-empty` and `schedule:run` from protected routes

