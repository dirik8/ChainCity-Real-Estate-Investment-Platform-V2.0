## Background Jobs & Schedules

### Scheduled Tasks (app/Console/Kernel.php)
- Daily: `main:cron`, `badge:cron`
- Daily: model prune for `Deposit`, `Payout`
- Daily: `UpdatePropertyJob`
- Every 5 minutes: `binance-payout-status:update` (if Binance payout method active)
- Every 30 minutes: `blockIo:ipn` (if BlockIo gateway enabled)
- Conditional updates based on Basic Control settings:
  - Fiat currency rates: `fiat-currency:update`, `payout-currency:update`
  - Crypto rates: `crypto-currency:update`, `payout-crypto-currency:update`

### Queue Workers
- Run `php artisan queue:work` for processing jobs
- Ensure supervisor/systemd in production for resilience

### Admin Schedule Configuration
- Profit schedules managed via Admin > profit/schedule
- Generic schedule list options defined in `config/schedulelist.php`
