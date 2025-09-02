## Payments & Payouts

### Deposits (Add Funds)
Controllers: `User\DepositController`, `Api\DepositController`, `PaymentController`

Flow:
1. User selects method and amount (supported currencies endpoint checks)
2. Create deposit (trx id)
3. Redirect to gateway or show instructions
4. Gateway IPN hits `/api/payment/{code}/{trx?}/{type?}` handled by `Api\PaymentController@gatewayIpn`
5. Success/failed callbacks mapped to `payment.success`/`payment.failed`

Supported Providers (packages installed): Stripe, Razorpay, Mollie, Flutterwave, Paystack, Midtrans, CoinGate, CinetPay, Authorize.Net. Configure credentials in admin panel and .env as needed.

### Payouts (Withdrawals)
Controllers: `User\PayoutController`, `Api\PayoutController`, `Admin\PayoutMethodController`, `Admin\PayoutLogController`

Flow:
1. User views available payout methods, limits, fees
2. Submit payout request (with bank form/list if applicable)
3. Auto methods: handled via provider APIs (e.g., Flutterwave/Paystack) endpoints
4. Manual methods: admin reviews and approves

### Transactions & Funds
- Deposits create `Fund` and `Transaction` records
- Payouts create `Payout` and `Transaction` records
- Admin can search and act on payment/payout logs

### Security & Validation
- Amount checks per method, supported currencies validation
- reCAPTCHA and 2FA optional

