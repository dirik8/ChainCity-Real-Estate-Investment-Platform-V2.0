## Overview

This application enables fractional property investment with a built-in secondary market for trading property shares. It provides a full-featured admin panel, a user web interface, and a REST API for mobile/SPA.

### Core Features
- **Authentication & Security**: Email/SMS verification, optional 2FA (Google2FA), Laravel Sanctum tokens
- **KYC**: Collect and verify KYC data before sensitive actions
- **Wallet & Payments**:
  - Add funds (deposits) via multiple gateways with IPN handling
  - Track transactions and funds
  - Withdraw via payouts (manual/auto methods, limits, fees, supported currencies)
- **Property Investment**:
  - Browse properties, view details, investor profiles, reviews
  - Invest in properties, view investment history, complete due payments
  - Create/list property shares and trade in secondary market
  - Offers workflow: send/accept/reject/remove, conversation thread, payment lock/confirm/cancel
- **Collections**: Wishlist management
- **Transfers**: User-to-user money transfer and history
- **Referrals & Ranks**: Referral tree, bonuses, ranking and rank bonuses
- **Content & CMS**: Blog, categories, static pages, menus, SEO, multilingual support
- **Support**: User support tickets with attachments
- **Notifications**: In-app, push notifications (FCM), and Pusher Channels
- **Admin**: Users, roles/permissions, investments lifecycle, payments/payouts, KYC, languages, templates, plugins, storage, maintenance, themes, analytics charts

### Interfaces
- **Web (routes/web.php)**: User dashboard and features under `/user/*`, plus public pages, blog, property listings
- **Admin (routes/admin.php)**: Role-based admin at `/admin/*` (prefix configurable)
- **API (routes/api.php)**: Mobile/SPA endpoints under `/api/*` protected by Sanctum

