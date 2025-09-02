# ChainCity Deployment & Configuration Guide

## Table of Contents
1. [Environment Configuration](#environment-configuration)
2. [Server Requirements](#server-requirements)
3. [Installation Steps](#installation-steps)
4. [Web Server Configuration](#web-server-configuration)
5. [Database Setup](#database-setup)
6. [Queue & Cron Configuration](#queue--cron-configuration)
7. [SSL & Security Setup](#ssl--security-setup)
8. [Performance Optimization](#performance-optimization)
9. [Monitoring & Maintenance](#monitoring--maintenance)
10. [Troubleshooting](#troubleshooting)

---

## Environment Configuration

### Complete .env Configuration

Create a `.env` file in the project root with the following configuration:

```env
# Application Settings
APP_NAME="ChainCity"
APP_ENV=production
APP_KEY=base64:YOUR_GENERATED_KEY_HERE
APP_DEBUG=false
APP_URL=https://yourdomain.com
APP_TIMEZONE=UTC

# Logging
LOG_CHANNEL=daily
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=error

# Database Configuration
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=chaincity_db
DB_USERNAME=chaincity_user
DB_PASSWORD=strong_password_here

# Cache & Session
BROADCAST_DRIVER=pusher
CACHE_DRIVER=redis
FILESYSTEM_DISK=local
QUEUE_CONNECTION=redis
SESSION_DRIVER=database
SESSION_LIFETIME=120

# Redis Configuration
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379
REDIS_CLIENT=predis

# Mail Configuration
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailgun.org
MAIL_PORT=587
MAIL_USERNAME=your_mail_username
MAIL_PASSWORD=your_mail_password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS="noreply@chaincity.com"
MAIL_FROM_NAME="${APP_NAME}"

# AWS Configuration (for S3 storage)
AWS_ACCESS_KEY_ID=your_aws_key
AWS_SECRET_ACCESS_KEY=your_aws_secret
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=chaincity-bucket
AWS_USE_PATH_STYLE_ENDPOINT=false

# Pusher Configuration (Real-time)
PUSHER_APP_ID=your_pusher_app_id
PUSHER_APP_KEY=your_pusher_key
PUSHER_APP_SECRET=your_pusher_secret
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

# Payment Gateway: Stripe
STRIPE_KEY=pk_live_your_stripe_public_key
STRIPE_SECRET=sk_live_your_stripe_secret_key
STRIPE_WEBHOOK_SECRET=whsec_your_webhook_secret

# Payment Gateway: PayPal
PAYPAL_MODE=live
PAYPAL_CLIENT_ID=your_paypal_client_id
PAYPAL_SECRET=your_paypal_secret
PAYPAL_WEBHOOK_ID=your_webhook_id

# Payment Gateway: Razorpay
RAZORPAY_KEY=rzp_live_your_key
RAZORPAY_SECRET=your_razorpay_secret

# Payment Gateway: Coingate
COINGATE_AUTH_TOKEN=your_coingate_token
COINGATE_ENVIRONMENT=live

# SMS Configuration: Twilio
TWILIO_SID=ACyour_twilio_sid
TWILIO_TOKEN=your_twilio_token
TWILIO_FROM=+1234567890

# SMS Configuration: Nexmo/Vonage
NEXMO_KEY=your_nexmo_key
NEXMO_SECRET=your_nexmo_secret
NEXMO_SMS_FROM=ChainCity

# Firebase Configuration
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n"
FIREBASE_CLIENT_EMAIL=firebase-adminsdk@project.iam.gserviceaccount.com
FIREBASE_DATABASE_URL=https://your-project.firebaseio.com

# Google Services
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
GOOGLE_REDIRECT_URL=${APP_URL}/auth/google/callback
GOOGLE_MAPS_API_KEY=your_maps_api_key
GOOGLE_TRANSLATE_API_KEY=your_translate_api_key
GOOGLE_RECAPTCHA_SITE_KEY=your_recaptcha_site_key
GOOGLE_RECAPTCHA_SECRET_KEY=your_recaptcha_secret_key

# Social Login: Facebook
FACEBOOK_CLIENT_ID=your_facebook_app_id
FACEBOOK_CLIENT_SECRET=your_facebook_secret
FACEBOOK_REDIRECT_URL=${APP_URL}/auth/facebook/callback

# Social Login: Twitter
TWITTER_CLIENT_ID=your_twitter_client_id
TWITTER_CLIENT_SECRET=your_twitter_secret
TWITTER_REDIRECT_URL=${APP_URL}/auth/twitter/callback

# Security
SECURE_COOKIES=true
SESSION_SECURE_COOKIE=true
```

---

## Server Requirements

### Minimum Requirements
- **OS**: Ubuntu 20.04 LTS / CentOS 8 / Debian 11
- **Web Server**: Apache 2.4+ or Nginx 1.18+
- **PHP**: 8.1+ with required extensions
- **Database**: MySQL 8.0+ or PostgreSQL 13+
- **RAM**: 4GB minimum (8GB recommended)
- **Storage**: 20GB minimum (50GB recommended)
- **CPU**: 2 cores minimum (4 cores recommended)

### Required PHP Extensions
```bash
# Check PHP version
php -v

# Required extensions
php -m | grep -E "bcmath|ctype|curl|dom|fileinfo|json|mbstring|openssl|pcre|pdo|tokenizer|xml|gd|zip|redis"
```

Install missing extensions:
```bash
# Ubuntu/Debian
sudo apt-get install php8.1-bcmath php8.1-ctype php8.1-curl php8.1-dom \
php8.1-fileinfo php8.1-json php8.1-mbstring php8.1-openssl \
php8.1-pcre php8.1-pdo php8.1-tokenizer php8.1-xml php8.1-gd \
php8.1-zip php8.1-redis php8.1-mysql

# CentOS/RHEL
sudo yum install php81-bcmath php81-ctype php81-curl php81-dom \
php81-fileinfo php81-json php81-mbstring php81-openssl \
php81-pcre php81-pdo php81-tokenizer php81-xml php81-gd \
php81-zip php81-redis php81-mysqlnd
```

---

## Installation Steps

### 1. Server Preparation
```bash
# Update system
sudo apt-get update && sudo apt-get upgrade -y

# Install required packages
sudo apt-get install git composer nodejs npm redis-server supervisor -y

# Create application directory
sudo mkdir -p /var/www/chaincity
sudo chown -R $USER:www-data /var/www/chaincity
```

### 2. Clone Repository
```bash
cd /var/www/chaincity
git clone https://github.com/yourusername/chaincity.git .
```

### 3. Install Dependencies
```bash
# Install PHP dependencies
composer install --optimize-autoloader --no-dev

# Install Node dependencies
npm install

# Build frontend assets
npm run build
```

### 4. Environment Setup
```bash
# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate

# Edit .env file with your configuration
nano .env
```

### 5. Database Setup
```bash
# Create database
mysql -u root -p
CREATE DATABASE chaincity_db;
CREATE USER 'chaincity_user'@'localhost' IDENTIFIED BY 'strong_password';
GRANT ALL PRIVILEGES ON chaincity_db.* TO 'chaincity_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# Run migrations
php artisan migrate --force

# Seed initial data (optional)
php artisan db:seed --force
```

### 6. Storage Setup
```bash
# Create storage link
php artisan storage:link

# Set permissions
sudo chown -R www-data:www-data storage bootstrap/cache
sudo chmod -R 775 storage bootstrap/cache
```

### 7. Optimization
```bash
# Cache configuration
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan optimize
```

---

## Web Server Configuration

### Nginx Configuration

Create `/etc/nginx/sites-available/chaincity`:

```nginx
server {
    listen 80;
    listen [::]:80;
    server_name yourdomain.com www.yourdomain.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name yourdomain.com www.yourdomain.com;
    root /var/www/chaincity/public;

    # SSL Configuration
    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    # Security Headers
    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-Content-Type-Options "nosniff";
    add_header X-XSS-Protection "1; mode=block";
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    index index.php;
    charset utf-8;

    # Logging
    access_log /var/log/nginx/chaincity-access.log;
    error_log /var/log/nginx/chaincity-error.log;

    # Max upload size
    client_max_body_size 100M;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    # PHP-FPM Configuration
    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
        fastcgi_hide_header X-Powered-By;
    }

    # Deny access to hidden files
    location ~ /\.(?!well-known).* {
        deny all;
    }

    # Cache static assets
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2|ttf|eot)$ {
        expires 30d;
        add_header Cache-Control "public, immutable";
    }

    # Gzip compression
    gzip on;
    gzip_comp_level 5;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
}
```

Enable the site:
```bash
sudo ln -s /etc/nginx/sites-available/chaincity /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

### Apache Configuration

Create `/etc/apache2/sites-available/chaincity.conf`:

```apache
<VirtualHost *:80>
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com
    Redirect permanent / https://yourdomain.com/
</VirtualHost>

<VirtualHost *:443>
    ServerName yourdomain.com
    ServerAlias www.yourdomain.com
    DocumentRoot /var/www/chaincity/public

    # SSL Configuration
    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/yourdomain.com/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/yourdomain.com/privkey.pem

    # Security Headers
    Header always set X-Frame-Options "SAMEORIGIN"
    Header always set X-Content-Type-Options "nosniff"
    Header always set X-XSS-Protection "1; mode=block"
    Header always set Strict-Transport-Security "max-age=31536000; includeSubDomains"

    <Directory /var/www/chaincity/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    # PHP Configuration
    <FilesMatch \.php$>
        SetHandler "proxy:unix:/var/run/php/php8.1-fpm.sock|fcgi://localhost"
    </FilesMatch>

    # Logging
    ErrorLog ${APACHE_LOG_DIR}/chaincity-error.log
    CustomLog ${APACHE_LOG_DIR}/chaincity-access.log combined

    # Compression
    <IfModule mod_deflate.c>
        AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript
    </IfModule>

    # Cache Control
    <IfModule mod_expires.c>
        ExpiresActive On
        ExpiresByType image/jpg "access plus 1 month"
        ExpiresByType image/jpeg "access plus 1 month"
        ExpiresByType image/gif "access plus 1 month"
        ExpiresByType image/png "access plus 1 month"
        ExpiresByType text/css "access plus 1 week"
        ExpiresByType application/javascript "access plus 1 week"
    </IfModule>
</VirtualHost>
```

Enable the site:
```bash
sudo a2ensite chaincity.conf
sudo a2enmod rewrite headers ssl expires deflate
sudo systemctl reload apache2
```

---

## Database Setup

### MySQL Optimization

Edit `/etc/mysql/mysql.conf.d/mysqld.cnf`:

```ini
[mysqld]
# Basic Settings
max_connections = 200
connect_timeout = 10
wait_timeout = 600
max_allowed_packet = 64M
thread_cache_size = 128
sort_buffer_size = 4M
bulk_insert_buffer_size = 16M
tmp_table_size = 32M
max_heap_table_size = 32M

# InnoDB Settings
innodb_buffer_pool_size = 1G
innodb_log_file_size = 256M
innodb_flush_log_at_trx_commit = 2
innodb_flush_method = O_DIRECT
innodb_file_per_table = 1

# Query Cache (MySQL 5.7)
query_cache_type = 1
query_cache_limit = 256K
query_cache_size = 64M

# Slow Query Log
slow_query_log = 1
slow_query_log_file = /var/log/mysql/slow.log
long_query_time = 2
```

### PostgreSQL Optimization

Edit `/etc/postgresql/13/main/postgresql.conf`:

```ini
# Memory Settings
shared_buffers = 256MB
effective_cache_size = 1GB
maintenance_work_mem = 64MB
work_mem = 4MB

# Connection Settings
max_connections = 200
superuser_reserved_connections = 3

# Write Performance
checkpoint_completion_target = 0.9
wal_buffers = 16MB
default_statistics_target = 100
random_page_cost = 1.1

# Logging
log_min_duration_statement = 1000
log_line_prefix = '%t [%p]: [%l-1] user=%u,db=%d,app=%a,client=%h '
log_checkpoints = on
log_connections = on
log_disconnections = on
log_lock_waits = on
log_temp_files = 0
```

### Database Backup Script

Create `/usr/local/bin/chaincity-backup.sh`:

```bash
#!/bin/bash

# Configuration
DB_NAME="chaincity_db"
DB_USER="chaincity_user"
DB_PASS="your_password"
BACKUP_DIR="/var/backups/chaincity"
DATE=$(date +%Y%m%d_%H%M%S)
RETENTION_DAYS=30

# Create backup directory
mkdir -p $BACKUP_DIR

# Perform backup
mysqldump -u$DB_USER -p$DB_PASS $DB_NAME | gzip > $BACKUP_DIR/backup_$DATE.sql.gz

# Upload to S3 (optional)
aws s3 cp $BACKUP_DIR/backup_$DATE.sql.gz s3://your-backup-bucket/chaincity/

# Remove old backups
find $BACKUP_DIR -name "backup_*.sql.gz" -mtime +$RETENTION_DAYS -delete

# Log
echo "Backup completed: backup_$DATE.sql.gz" >> /var/log/chaincity-backup.log
```

Make executable and add to crontab:
```bash
chmod +x /usr/local/bin/chaincity-backup.sh

# Add to crontab (daily at 2 AM)
0 2 * * * /usr/local/bin/chaincity-backup.sh
```

---

## Queue & Cron Configuration

### Queue Worker Setup

Create `/etc/supervisor/conf.d/chaincity-worker.conf`:

```ini
[program:chaincity-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/chaincity/artisan queue:work redis --sleep=3 --tries=3 --max-time=3600
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=www-data
numprocs=4
redirect_stderr=true
stdout_logfile=/var/log/chaincity/worker.log
stopwaitsecs=3600
```

Start workers:
```bash
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start chaincity-worker:*
```

### Cron Jobs

Add to crontab:
```bash
sudo crontab -e -u www-data
```

Add the following:
```cron
# Laravel scheduler
* * * * * cd /var/www/chaincity && php artisan schedule:run >> /dev/null 2>&1

# Clear expired sessions (daily)
0 0 * * * cd /var/www/chaincity && php artisan session:gc

# Clear old logs (weekly)
0 0 * * 0 cd /var/www/chaincity && php artisan log:clear --keep=30

# Generate sitemap (daily)
0 1 * * * cd /var/www/chaincity && php artisan sitemap:generate

# Process investment returns (daily)
0 3 * * * cd /var/www/chaincity && php artisan investment:process-returns

# Send notification reminders (hourly)
0 * * * * cd /var/www/chaincity && php artisan notification:send-reminders
```

---

## SSL & Security Setup

### Let's Encrypt SSL

```bash
# Install Certbot
sudo apt-get install certbot python3-certbot-nginx

# Obtain certificate
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Auto-renewal
sudo certbot renew --dry-run
```

### Security Hardening

#### Firewall Configuration
```bash
# Install UFW
sudo apt-get install ufw

# Configure firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
```

#### Fail2ban Setup
```bash
# Install Fail2ban
sudo apt-get install fail2ban

# Create custom jail
sudo nano /etc/fail2ban/jail.local
```

Add:
```ini
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 5

[sshd]
enabled = true

[nginx-http-auth]
enabled = true

[nginx-noscript]
enabled = true

[chaincity-login]
enabled = true
port = http,https
filter = chaincity-login
logpath = /var/www/chaincity/storage/logs/laravel.log
maxretry = 3
```

Create filter `/etc/fail2ban/filter.d/chaincity-login.conf`:
```ini
[Definition]
failregex = ^.*Failed login attempt.*IP: <HOST>.*$
ignoreregex =
```

#### File Permissions
```bash
# Set secure permissions
find /var/www/chaincity -type f -exec chmod 644 {} \;
find /var/www/chaincity -type d -exec chmod 755 {} \;
chmod -R 775 /var/www/chaincity/storage
chmod -R 775 /var/www/chaincity/bootstrap/cache
chown -R www-data:www-data /var/www/chaincity
```

---

## Performance Optimization

### PHP-FPM Optimization

Edit `/etc/php/8.1/fpm/pool.d/www.conf`:

```ini
[www]
pm = dynamic
pm.max_children = 50
pm.start_servers = 10
pm.min_spare_servers = 5
pm.max_spare_servers = 20
pm.max_requests = 500

; Process timeout
request_terminate_timeout = 300

; Memory limit
php_admin_value[memory_limit] = 256M
```

### Redis Configuration

Edit `/etc/redis/redis.conf`:

```ini
# Memory management
maxmemory 512mb
maxmemory-policy allkeys-lru

# Persistence
save 900 1
save 300 10
save 60 10000

# Performance
tcp-keepalive 60
timeout 300
```

### OPcache Configuration

Edit `/etc/php/8.1/fpm/conf.d/10-opcache.ini`:

```ini
opcache.enable=1
opcache.memory_consumption=256
opcache.interned_strings_buffer=16
opcache.max_accelerated_files=10000
opcache.revalidate_freq=2
opcache.fast_shutdown=1
opcache.enable_cli=1
```

### CDN Configuration

```env
# In .env file
CDN_URL=https://cdn.yourdomain.com
ASSET_URL=${CDN_URL}
```

Configure CDN for static assets:
- Images
- CSS files
- JavaScript files
- Fonts

---

## Monitoring & Maintenance

### Application Monitoring

#### Laravel Telescope (Development)
```bash
composer require laravel/telescope --dev
php artisan telescope:install
php artisan migrate
```

#### Production Monitoring
- **New Relic**: Application performance monitoring
- **Sentry**: Error tracking
- **Datadog**: Infrastructure monitoring

### Server Monitoring

#### Install monitoring tools
```bash
# Netdata for real-time monitoring
bash <(curl -Ss https://my-netdata.io/kickstart.sh)

# Monit for process monitoring
sudo apt-get install monit
```

Configure Monit `/etc/monit/conf.d/chaincity`:
```
check process nginx with pidfile /var/run/nginx.pid
    start program = "/etc/init.d/nginx start"
    stop program = "/etc/init.d/nginx stop"

check process php-fpm with pidfile /var/run/php/php8.1-fpm.pid
    start program = "/etc/init.d/php8.1-fpm start"
    stop program = "/etc/init.d/php8.1-fpm stop"

check process redis with pidfile /var/run/redis/redis-server.pid
    start program = "/etc/init.d/redis-server start"
    stop program = "/etc/init.d/redis-server stop"

check process mysql with pidfile /var/run/mysqld/mysqld.pid
    start program = "/etc/init.d/mysql start"
    stop program = "/etc/init.d/mysql stop"
```

### Log Management

#### Log Rotation
Create `/etc/logrotate.d/chaincity`:
```
/var/www/chaincity/storage/logs/*.log {
    daily
    missingok
    rotate 14
    compress
    delaycompress
    notifempty
    create 0640 www-data www-data
    sharedscripts
    postrotate
        systemctl reload php8.1-fpm
    endscript
}
```

#### Centralized Logging (ELK Stack)
```bash
# Install Elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install elasticsearch

# Install Logstash
sudo apt-get install logstash

# Install Kibana
sudo apt-get install kibana
```

---

## Troubleshooting

### Common Issues and Solutions

#### 1. 500 Internal Server Error
```bash
# Check Laravel logs
tail -f /var/www/chaincity/storage/logs/laravel.log

# Check web server logs
tail -f /var/log/nginx/chaincity-error.log

# Check permissions
ls -la /var/www/chaincity/storage
ls -la /var/www/chaincity/bootstrap/cache

# Clear caches
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
```

#### 2. Database Connection Error
```bash
# Test database connection
php artisan tinker
>>> DB::connection()->getPdo();

# Check credentials
cat .env | grep DB_

# Test MySQL connection
mysql -u chaincity_user -p chaincity_db
```

#### 3. Queue Not Processing
```bash
# Check supervisor status
sudo supervisorctl status

# Restart workers
sudo supervisorctl restart chaincity-worker:*

# Check Redis
redis-cli ping

# Clear failed jobs
php artisan queue:flush
```

#### 4. Payment Gateway Issues
```bash
# Check webhook logs
tail -f /var/www/chaincity/storage/logs/webhook.log

# Test webhook endpoint
curl -X POST https://yourdomain.com/webhook/stripe \
  -H "Content-Type: application/json" \
  -d '{"test": "data"}'

# Verify SSL certificate
openssl s_client -connect yourdomain.com:443
```

#### 5. Performance Issues
```bash
# Check server resources
top
htop
free -m
df -h

# Check slow queries
tail -f /var/log/mysql/slow.log

# Monitor PHP-FPM
sudo systemctl status php8.1-fpm
ps aux | grep php-fpm

# Check Redis
redis-cli info stats
```

### Debug Mode (Development Only)
```env
# Enable debug mode in .env
APP_DEBUG=true
APP_ENV=local

# Enable query logging
DB_LOG_QUERIES=true
```

### Health Check Endpoint
Create a health check route:
```php
// routes/web.php
Route::get('/health', function () {
    return response()->json([
        'status' => 'healthy',
        'database' => DB::connection()->getPdo() ? 'connected' : 'disconnected',
        'redis' => Redis::ping() ? 'connected' : 'disconnected',
        'queue' => Queue::size() < 1000 ? 'healthy' : 'backed up',
    ]);
});
```

---

## Deployment Checklist

### Pre-Deployment
- [ ] Backup current database
- [ ] Test deployment on staging
- [ ] Review environment variables
- [ ] Check SSL certificates
- [ ] Verify payment gateway credentials

### Deployment
- [ ] Enable maintenance mode: `php artisan down`
- [ ] Pull latest code: `git pull origin main`
- [ ] Install dependencies: `composer install --no-dev`
- [ ] Run migrations: `php artisan migrate --force`
- [ ] Build assets: `npm run build`
- [ ] Clear caches: `php artisan optimize:clear`
- [ ] Cache configuration: `php artisan optimize`
- [ ] Restart queue workers: `sudo supervisorctl restart all`
- [ ] Disable maintenance mode: `php artisan up`

### Post-Deployment
- [ ] Test critical user flows
- [ ] Verify payment processing
- [ ] Check error logs
- [ ] Monitor performance metrics
- [ ] Send deployment notification

---

**Deployment Guide Version**: 1.0  
**Last Updated**: January 2025  
**Platform**: ChainCity Real Estate Investment