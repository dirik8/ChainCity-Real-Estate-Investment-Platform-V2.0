## Deployment

### Requirements
- PHP >= 8.1, Composer
- Node.js and npm for assets
- Database (MySQL/MariaDB/PostgreSQL), Redis (optional)

### Steps
1. Copy `.env` and set secrets per `docs/ENVIRONMENT.md`
2. `composer install --no-dev --optimize-autoloader`
3. `php artisan key:generate`
4. `php artisan migrate --force` and seed if first deploy
5. `npm ci && npm run build`
6. `php artisan optimize`
7. Configure web server to point to `public/`; enable HTTPS
8. Setup queue worker and scheduler
   - `systemd` service for `php artisan queue:work`
   - Cron: `* * * * * php /path/to/artisan schedule:run >> /dev/null 2>&1`

### Assets & Storage
- Run `php artisan storage:link` if serving local files
- Configure `FILESYSTEM_DISK`

### Monitoring
- Enable logging, error reporting appropriate to env
- Use health checks and queue monitoring

