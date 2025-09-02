## Getting Started

### Requirements
- PHP ^8.1, Composer
- Node.js (for asset build with Vite)
- Database (MySQL/MariaDB)
- Redis (optional for queues/cache)

### Installation
1. Clone repository
2. composer install
3. cp .env.example .env && php artisan key:generate
4. Configure DB and other environment variables
5. php artisan migrate --seed
6. npm install && npm run build (or dev)
7. php artisan storage:link

### Running
- php artisan serve
- php artisan queue:work (for background jobs)
- php artisan schedule:work (or set system cron `* * * * * php artisan schedule:run`)

Default admin prefix is configurable via Basic Control. Access admin login at /admin (or custom prefix).
