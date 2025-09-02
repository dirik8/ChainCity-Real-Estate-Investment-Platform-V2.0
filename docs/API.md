## REST API

Base URL: `/api`
Auth: Laravel Sanctum (Bearer tokens). Some endpoints are public.

### Auth
- POST `/api/register`
- POST `/api/login`
- POST `/api/logout` (auth)
- POST `/api/reset/password/email`
- POST `/api/reset/password/code`
- POST `/api/password/reset`

### Verification (auth)
- POST `/api/twofa-verify`
- POST `/api/mail-verify`
- POST `/api/sms-verify`
- GET `/api/resend-code`

### Onboarding & Dashboard (auth)
- GET `/api/onboard-list` (public)
- GET `/api/dashboard`
- GET `/api/language/{id?}`

### Deposits (auth)
- GET `/api/add/fund`
- GET `/api/deposit/check/amount`
- POST `/api/payment/request`
- POST `/api/payment/done`
- POST `/api/card/payment`
- POST `/api/other/payment`
- POST `/api/manual/payment`

### Payouts (auth)
- GET `/api/payout`
- GET `/api/payout/check/amount`
- POST `/api/payout/get/bank/list`
- POST `/api/payout/get/bank/from`
- POST `/api/payout/paystack/submit`
- POST `/api/payout/flutterwave/submit`
- POST `/api/payout/submit/confirm`

### Payment flow helpers (auth, optional)
- GET `/api/payment/process/{trx_id}`
- POST `/api/add/fund/confirm/{trx_id}`

### Investments (auth)
- POST `/api/invest/property/{id}`
- GET `/api/invest/history`
- GET `/api/invest/history/details/{id}`
- POST `/api/complete/due/payment/{id}`

### Transactions & Lists (auth)
- GET `/api/transaction`
- GET `/api/fund-list`
- GET `/api/payout-list`

### Collections (auth)
- GET `/api/wishlists`
- POST `/api/wishlist/add`
- POST `/api/wishlist/remove`
- POST `/api/wishlist/delete` or DELETE `/api/wishlist/delete/{id?}`

### Money Transfer (auth)
- GET `/api/money/transfer`
- POST `/api/money/transfer/store`
- GET `/api/money/transfer/history`

### Referral & Ranking (auth)
- GET `/api/referral`
- GET `/api/referral/bonus`
- GET `/api/rankings`

### Support Tickets (auth)
- POST `/api/support/ticket/store`
- GET `/api/support/ticket/list`
- GET `/api/support/ticket/view/{ticket}`
- POST `/api/support/ticket/reply/{ticket}`
- PATCH `/api/close-ticket/{id}`

### Two-Step Security (auth)
- GET `/api/two/step/security`
- POST `/api/two/step/enable`
- POST `/api/two/step/disable`

### Profile & KYC (auth)
- GET `/api/user/profile`
- POST `/api/update/user/profile`
- POST `/api/change/password`
- POST `/api/delete-account`
- GET `/api/kycs`
- POST `/api/kyc-submit`

### Notifications (auth)
- GET `/api/notification/permission`
- POST `/api/notification/permission/update`
- GET `/api/pusher/configuration`

### Property Market (auth)
- GET `/api/investment/properties`
- GET `/api/share/market`
- POST `/api/property/make/offer/{id}`
- POST `/api/direct/buy/share/{id}`
- GET `/api/my/properties`
- POST `/api/property/share/store/{id}`
- GET `/api/my/shared/properties`
- POST `/api/property/share/update/{id}`
- DELETE `/api/property/share/remove/{id}`
- GET `/api/send/offer/properties`
- DELETE `/api/property/offer/remove/{id}`
- GET `/api/receive/offer/properties`
- GET `/api/property`
- GET `/api/property-details/{id}`
- GET `/api/investor-profile/{id}/{username}`

#### Offers & Payment Lock (auth)
- GET `/api/offer/list/{id}`
- POST `/api/offer/accept/{id}`
- POST `/api/offer/reject/{id}`
- DELETE `/api/offer/remove/{id}`
- GET `/api/offer/conversation/{id}`
- POST `/api/offer/reply/message`
- POST `/api/offer/payment/lock/{id}`
- POST `/api/offer/payment/lock/update/{id}`
- GET `/api/payment/lock/cancel/{id}`
- POST `/api/payment/lock/confirm/{id}`

### Public
- GET `/api/propertyReviews/{id?}`
- MATCH GET|POST `/api/payment/{code}/{trx?}/{type?}` (IPN)
- POST `/api/payout/{code}` (IPN)

