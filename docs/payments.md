## Payments, Deposits & Payouts

### Deposits (Add Fund)
- API and Web flows for deposit initiation and confirmation
- Supported gateways via `Gateways` and Admin Payment Methods (Stripe, Paystack, Flutterwave, Razorpay, Authorize.net, Coingate, Midtrans, CinetPay, etc.)
- Manual gateway support
- Success/Failed callbacks and IPNs (`routes/web.php`, `routes/api.php`)

### Payouts
- User can request payout; supports bank list/form retrieval and auto/manual processors
- Admin reviews and actions payout requests; logs in admin panel
- Binance payout status checker (scheduled)

### Money Transfer
- Internal balance transfers between users

### Currency Updates
- Fiat and crypto currency updates based on schedule and Basic Control settings
