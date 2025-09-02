## Web User Features

### Public
- Landing pages, blog and categories, property listing and details, investor profiles
- Subscribe and contact form
- Language switcher at `/language/{locale}`

### Auth & Verification
- Register (with optional sponsor), login (including Socialite), forgot/reset password
- Email/SMS/2FA verification flow under `/user/*` routes

### Dashboard
- Wallet overview: funds, transactions, notifications
- Add fund, fund history, transaction history

### KYC & Security
- KYC submission, history
- Password update, profile updates, 2FA enable/disable/regenerate

### Property Investment
- Invest in property, view invest history and details, complete due payments
- Reviews on properties
- Wishlist: add, list, delete

### Secondary Market (Shares & Offers)
- List property shares to sell, update/remove shares
- Make offers, view offers list, accept/reject/remove
- Offer conversation thread and payment lock/confirm/cancel

### Transfers, Referrals, and Ranks
- Money transfer to other users, history
- Referral page, referral bonuses, direct referrals
- Ranks page

### Support & Notifications
- Support tickets: create, view, reply, download, close
- In-app notifications: mark read, read all; Push notifications via FCM

