# Deployment Guide

This comprehensive guide covers deployment strategies, server configuration, and production setup for the Real Estate Investment Platform.

## Table of Contents

1. [Deployment Overview](#deployment-overview)
2. [Server Requirements](#server-requirements)
3. [Environment Setup](#environment-setup)
4. [Database Configuration](#database-configuration)
5. [Web Server Configuration](#web-server-configuration)
6. [SSL Certificate Setup](#ssl-certificate-setup)
7. [Queue Workers](#queue-workers)
8. [Caching Configuration](#caching-configuration)
9. [File Storage](#file-storage)
10. [Monitoring & Logging](#monitoring--logging)
11. [Backup Strategy](#backup-strategy)
12. [Security Hardening](#security-hardening)

## Deployment Overview

### Deployment Options

#### 1. Traditional Server Deployment
- **VPS/Dedicated Server**: Full control over server environment
- **Shared Hosting**: Limited but cost-effective option
- **Managed Hosting**: Professional Laravel hosting services

#### 2. Cloud Deployment
- **AWS**: Comprehensive cloud services
- **DigitalOcean**: Developer-friendly cloud platform
- **Google Cloud Platform**: Scalable cloud infrastructure
- **Microsoft Azure**: Enterprise cloud services

#### 3. Container Deployment
- **Docker**: Containerized application deployment
- **Kubernetes**: Container orchestration
- **Docker Swarm**: Docker native clustering

#### 4. Platform as a Service (PaaS)
- **Laravel Forge**: Laravel deployment automation
- **Heroku**: Simple application deployment
- **Platform.sh**: Professional PaaS for PHP

## Server Requirements

### Minimum Requirements

#### Hardware Specifications
- **CPU**: 2 vCPU cores minimum (4+ recommended)
- **RAM**: 4GB minimum (8GB+ recommended)
- **Storage**: 50GB SSD minimum (100GB+ recommended)
- **Bandwidth**: 1TB/month minimum

#### Software Requirements
- **Operating System**: Ubuntu 20.04 LTS or CentOS 8+
- **Web Server**: Nginx 1.18+ or Apache 2.4+
- **PHP**: 8.1 or higher
- **Database**: MySQL 8.0+ or PostgreSQL 13+
- **Cache**: Redis 6.0+ (recommended)
- **Process Manager**: Supervisor for queue workers

### PHP Extensions Required

```bash
# Required PHP extensions
php8.1-cli
php8.1-fpm
php8.1-mysql
php8.1-pgsql
php8.1-sqlite3
php8.1-redis
php8.1-curl
php8.1-gd
php8.1-mbstring
php8.1-xml
php8.1-zip
php8.1-bcmath
php8.1-intl
php8.1-imagick
php8.1-fileinfo
php8.1-tokenizer
php8.1-json
```

### Performance Recommendations

#### Production Environment
- **CPU**: 8+ vCPU cores
- **RAM**: 16GB+ 
- **Storage**: 200GB+ NVMe SSD
- **Database**: Dedicated database server
- **Cache**: Redis cluster for high availability
- **CDN**: Content delivery network for static assets

## Environment Setup

### 1. Server Preparation

#### Ubuntu 20.04 Setup
```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install -y curl wget git unzip software-properties-common

# Add PHP repository
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update

# Install PHP and extensions
sudo apt install -y php8.1 php8.1-fpm php8.1-cli php8.1-mysql php8.1-redis \
    php8.1-curl php8.1-gd php8.1-mbstring php8.1-xml php8.1-zip \
    php8.1-bcmath php8.1-intl php8.1-imagick php8.1-fileinfo

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
```

### 2. Database Installation

#### MySQL 8.0 Installation
```bash
# Install MySQL
sudo apt install -y mysql-server

# Secure MySQL installation
sudo mysql_secure_installation

# Create database and user
sudo mysql -u root -p
```

```sql
-- Create database
CREATE DATABASE real_estate_platform CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create user
CREATE USER 'platform_user'@'localhost' IDENTIFIED BY 'secure_password_here';

-- Grant privileges
GRANT ALL PRIVILEGES ON real_estate_platform.* TO 'platform_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

#### Redis Installation
```bash
# Install Redis
sudo apt install -y redis-server

# Configure Redis
sudo nano /etc/redis/redis.conf

# Set password (uncomment and modify)
requirepass your_redis_password_here

# Restart Redis
sudo systemctl restart redis-server
sudo systemctl enable redis-server
```

### 3. Application Deployment

#### Clone and Setup Application
```bash
# Clone repository
cd /var/www
sudo git clone https://github.com/yourrepo/real-estate-platform.git
sudo chown -R www-data:www-data real-estate-platform
cd real-estate-platform

# Install PHP dependencies
sudo -u www-data composer install --optimize-autoloader --no-dev

# Install Node.js dependencies
sudo -u www-data npm install

# Build assets
sudo -u www-data npm run build
```

#### Environment Configuration
```bash
# Copy environment file
sudo -u www-data cp .env.example .env

# Generate application key
sudo -u www-data php artisan key:generate

# Configure environment
sudo -u www-data nano .env
```

#### Environment Variables (.env)
```env
APP_NAME="Real Estate Investment Platform"
APP_ENV=production
APP_KEY=base64:your-generated-key-here
APP_DEBUG=false
APP_URL=https://yourplatform.com

# Database Configuration
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=real_estate_platform
DB_USERNAME=platform_user
DB_PASSWORD=secure_password_here

# Cache Configuration
CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_CONNECTION=redis

# Redis Configuration
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=your_redis_password_here
REDIS_PORT=6379

# Mail Configuration
MAIL_MAILER=smtp
MAIL_HOST=your-smtp-host
MAIL_PORT=587
MAIL_USERNAME=your-email
MAIL_PASSWORD=your-password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=noreply@yourplatform.com
MAIL_FROM_NAME="${APP_NAME}"

# File Storage
FILESYSTEM_DISK=s3
AWS_ACCESS_KEY_ID=your-access-key
AWS_SECRET_ACCESS_KEY=your-secret-key
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=your-bucket-name

# Payment Gateways
STRIPE_KEY=pk_live_your-stripe-key
STRIPE_SECRET=sk_live_your-stripe-secret
STRIPE_WEBHOOK_SECRET=whsec_your-webhook-secret

PAYPAL_CLIENT_ID=your-paypal-client-id
PAYPAL_CLIENT_SECRET=your-paypal-client-secret
PAYPAL_MODE=live

# Firebase Configuration
FIREBASE_API_KEY=your-firebase-api-key
FIREBASE_AUTH_DOMAIN=your-project.firebaseapp.com
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_STORAGE_BUCKET=your-project.appspot.com
FIREBASE_MESSAGING_SENDER_ID=your-sender-id
FIREBASE_APP_ID=your-app-id
```

#### Database Migration and Seeding
```bash
# Run migrations
sudo -u www-data php artisan migrate --force

# Seed database (optional)
sudo -u www-data php artisan db:seed --force

# Clear and cache configuration
sudo -u www-data php artisan config:cache
sudo -u www-data php artisan route:cache
sudo -u www-data php artisan view:cache
```

#### File Permissions
```bash
# Set proper permissions
sudo chown -R www-data:www-data /var/www/real-estate-platform
sudo chmod -R 755 /var/www/real-estate-platform
sudo chmod -R 775 /var/www/real-estate-platform/storage
sudo chmod -R 775 /var/www/real-estate-platform/bootstrap/cache

# Create symbolic link for storage
sudo -u www-data php artisan storage:link
```

## Web Server Configuration

### Nginx Configuration

#### Main Nginx Configuration
```nginx
# /etc/nginx/sites-available/real-estate-platform
server {
    listen 80;
    server_name yourplatform.com www.yourplatform.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name yourplatform.com www.yourplatform.com;
    root /var/www/real-estate-platform/public;

    # SSL Configuration
    ssl_certificate /etc/letsencrypt/live/yourplatform.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourplatform.com/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384;
    ssl_prefer_server_ciphers off;

    # Security Headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header Referrer-Policy "no-referrer-when-downgrade" always;
    add_header Content-Security-Policy "default-src 'self' http: https: data: blob: 'unsafe-inline'" always;

    # Gzip Compression
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_proxied expired no-cache no-store private auth;
    gzip_types text/plain text/css text/xml text/javascript application/x-javascript application/xml+rss;

    # Index and try files
    index index.php;
    charset utf-8;

    # Main location block
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # PHP-FPM Configuration
    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        include fastcgi_params;
        fastcgi_hide_header X-Powered-By;
    }

    # Static file caching
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|woff|woff2|ttf|svg)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        access_log off;
    }

    # Security
    location ~ /\.(?!well-known).* {
        deny all;
    }

    # File size limits
    client_max_body_size 100M;
    client_body_timeout 120s;
}
```

#### Enable Site
```bash
# Enable site
sudo ln -s /etc/nginx/sites-available/real-estate-platform /etc/nginx/sites-enabled/

# Test configuration
sudo nginx -t

# Restart Nginx
sudo systemctl restart nginx
sudo systemctl enable nginx
```

### Apache Configuration

#### Virtual Host Configuration
```apache
# /etc/apache2/sites-available/real-estate-platform.conf
<VirtualHost *:80>
    ServerName yourplatform.com
    ServerAlias www.yourplatform.com
    Redirect permanent / https://yourplatform.com/
</VirtualHost>

<VirtualHost *:443>
    ServerName yourplatform.com
    ServerAlias www.yourplatform.com
    DocumentRoot /var/www/real-estate-platform/public

    # SSL Configuration
    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/yourplatform.com/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/yourplatform.com/privkey.pem

    # Security Headers
    Header always set X-Frame-Options "SAMEORIGIN"
    Header always set X-XSS-Protection "1; mode=block"
    Header always set X-Content-Type-Options "nosniff"

    # Directory Configuration
    <Directory /var/www/real-estate-platform/public>
        AllowOverride All
        Require all granted
    </Directory>

    # Logging
    ErrorLog ${APACHE_LOG_DIR}/real-estate-platform_error.log
    CustomLog ${APACHE_LOG_DIR}/real-estate-platform_access.log combined
</VirtualHost>
```

## SSL Certificate Setup

### Let's Encrypt SSL Certificate

#### Install Certbot
```bash
# Install Certbot
sudo apt install -y certbot python3-certbot-nginx

# Obtain SSL certificate
sudo certbot --nginx -d yourplatform.com -d www.yourplatform.com

# Test automatic renewal
sudo certbot renew --dry-run
```

#### Automatic Renewal
```bash
# Add cron job for automatic renewal
sudo crontab -e

# Add this line
0 12 * * * /usr/bin/certbot renew --quiet
```

## Queue Workers

### Supervisor Configuration

#### Install Supervisor
```bash
sudo apt install -y supervisor
```

#### Queue Worker Configuration
```ini
# /etc/supervisor/conf.d/real-estate-platform-worker.conf
[program:real-estate-platform-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/real-estate-platform/artisan queue:work redis --sleep=3 --tries=3 --max-time=3600
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=www-data
numprocs=2
redirect_stderr=true
stdout_logfile=/var/www/real-estate-platform/storage/logs/worker.log
stopwaitsecs=3600
```

#### Start Queue Workers
```bash
# Reload supervisor configuration
sudo supervisorctl reread
sudo supervisorctl update

# Start workers
sudo supervisorctl start real-estate-platform-worker:*

# Check status
sudo supervisorctl status
```

### Scheduled Tasks (Cron)

#### Laravel Scheduler
```bash
# Add to www-data crontab
sudo crontab -u www-data -e

# Add this line
* * * * * cd /var/www/real-estate-platform && php artisan schedule:run >> /dev/null 2>&1
```

## Caching Configuration

### Redis Configuration

#### Optimize Redis for Production
```bash
# Edit Redis configuration
sudo nano /etc/redis/redis.conf
```

```conf
# Memory optimization
maxmemory 2gb
maxmemory-policy allkeys-lru

# Persistence
save 900 1
save 300 10
save 60 10000

# Network
timeout 300
tcp-keepalive 300

# Security
requirepass your_secure_redis_password
```

### Application Caching

#### Cache Optimization Commands
```bash
# Clear all caches
sudo -u www-data php artisan cache:clear
sudo -u www-data php artisan config:clear
sudo -u www-data php artisan route:clear
sudo -u www-data php artisan view:clear

# Cache for production
sudo -u www-data php artisan config:cache
sudo -u www-data php artisan route:cache
sudo -u www-data php artisan view:cache

# Optimize autoloader
sudo -u www-data composer dump-autoload --optimize
```

## File Storage

### AWS S3 Configuration

#### S3 Bucket Setup
```bash
# Install AWS CLI
sudo apt install -y awscli

# Configure AWS credentials
aws configure
```

#### S3 Bucket Policy
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::your-bucket-name/public/*"
        }
    ]
}
```

### Local Storage Backup
```bash
# Create backup script
sudo nano /usr/local/bin/backup-storage.sh
```

```bash
#!/bin/bash
# Backup script for file storage

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backups/storage"
SOURCE_DIR="/var/www/real-estate-platform/storage/app"

# Create backup directory
mkdir -p $BACKUP_DIR

# Create backup
tar -czf $BACKUP_DIR/storage_backup_$DATE.tar.gz -C $SOURCE_DIR .

# Remove backups older than 30 days
find $BACKUP_DIR -name "storage_backup_*.tar.gz" -mtime +30 -delete

echo "Storage backup completed: $BACKUP_DIR/storage_backup_$DATE.tar.gz"
```

## Monitoring & Logging

### Log Management

#### Configure Log Rotation
```bash
# Create logrotate configuration
sudo nano /etc/logrotate.d/real-estate-platform
```

```conf
/var/www/real-estate-platform/storage/logs/*.log {
    daily
    missingok
    rotate 14
    compress
    delaycompress
    notifempty
    create 644 www-data www-data
    postrotate
        /bin/kill -USR1 `cat /var/run/php/php8.1-fpm.pid 2> /dev/null` 2> /dev/null || true
    endscript
}
```

### System Monitoring

#### Install Monitoring Tools
```bash
# Install htop and iotop
sudo apt install -y htop iotop

# Install Netdata (optional)
bash <(curl -Ss https://my-netdata.io/kickstart.sh)
```

#### Performance Monitoring Script
```bash
#!/bin/bash
# System monitoring script

echo "=== System Resources ==="
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}'

echo "Memory Usage:"
free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }'

echo "Disk Usage:"
df -h | awk '$NF=="/"{printf "%s\t\t", $5}'

echo "Load Average:"
uptime | awk -F'load average:' '{ print $2 }'

echo "=== Application Status ==="
echo "PHP-FPM Status:"
systemctl is-active php8.1-fpm

echo "Nginx Status:"
systemctl is-active nginx

echo "MySQL Status:"
systemctl is-active mysql

echo "Redis Status:"
systemctl is-active redis-server

echo "Queue Workers:"
supervisorctl status real-estate-platform-worker:*
```

## Backup Strategy

### Database Backup

#### Automated MySQL Backup
```bash
# Create backup script
sudo nano /usr/local/bin/backup-database.sh
```

```bash
#!/bin/bash
# Database backup script

DB_NAME="real_estate_platform"
DB_USER="platform_user"
DB_PASS="secure_password_here"
BACKUP_DIR="/backups/database"
DATE=$(date +%Y%m%d_%H%M%S)

# Create backup directory
mkdir -p $BACKUP_DIR

# Create database backup
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/db_backup_$DATE.sql

# Compress backup
gzip $BACKUP_DIR/db_backup_$DATE.sql

# Remove backups older than 30 days
find $BACKUP_DIR -name "db_backup_*.sql.gz" -mtime +30 -delete

echo "Database backup completed: $BACKUP_DIR/db_backup_$DATE.sql.gz"
```

#### Schedule Backups
```bash
# Add to root crontab
sudo crontab -e

# Daily database backup at 2 AM
0 2 * * * /usr/local/bin/backup-database.sh

# Daily storage backup at 3 AM
0 3 * * * /usr/local/bin/backup-storage.sh
```

### Full System Backup

#### Complete Backup Script
```bash
#!/bin/bash
# Complete system backup

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backups/complete"
APP_DIR="/var/www/real-estate-platform"

mkdir -p $BACKUP_DIR

# Backup application files
tar --exclude='storage/logs/*' --exclude='storage/framework/cache/*' \
    --exclude='storage/framework/sessions/*' --exclude='storage/framework/views/*' \
    -czf $BACKUP_DIR/app_backup_$DATE.tar.gz -C /var/www real-estate-platform

# Backup database
mysqldump -u platform_user -p$DB_PASS real_estate_platform | gzip > $BACKUP_DIR/db_backup_$DATE.sql.gz

# Backup configuration files
tar -czf $BACKUP_DIR/config_backup_$DATE.tar.gz /etc/nginx/sites-available/real-estate-platform /etc/supervisor/conf.d/real-estate-platform-worker.conf

echo "Complete backup finished: $BACKUP_DIR/"
```

## Security Hardening

### Server Security

#### Firewall Configuration
```bash
# Install and configure UFW
sudo apt install -y ufw

# Default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH
sudo ufw allow ssh

# Allow HTTP and HTTPS
sudo ufw allow 80
sudo ufw allow 443

# Enable firewall
sudo ufw enable
```

#### SSH Security
```bash
# Edit SSH configuration
sudo nano /etc/ssh/sshd_config
```

```conf
# Disable root login
PermitRootLogin no

# Change default port (optional)
Port 2222

# Disable password authentication (use keys only)
PasswordAuthentication no
PubkeyAuthentication yes

# Limit login attempts
MaxAuthTries 3
MaxStartups 2

# Disable empty passwords
PermitEmptyPasswords no
```

#### Fail2Ban Configuration
```bash
# Install Fail2Ban
sudo apt install -y fail2ban

# Configure Fail2Ban
sudo nano /etc/fail2ban/jail.local
```

```conf
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 3

[sshd]
enabled = true
port = ssh
logpath = /var/log/auth.log

[nginx-http-auth]
enabled = true
port = http,https
logpath = /var/log/nginx/error.log
```

### Application Security

#### Security Headers
Already configured in Nginx/Apache configuration above.

#### File Permissions Review
```bash
# Set secure permissions
find /var/www/real-estate-platform -type f -exec chmod 644 {} \;
find /var/www/real-estate-platform -type d -exec chmod 755 {} \;
chmod -R 775 /var/www/real-estate-platform/storage
chmod -R 775 /var/www/real-estate-platform/bootstrap/cache
chmod 600 /var/www/real-estate-platform/.env
```

#### Regular Security Updates
```bash
# Create update script
sudo nano /usr/local/bin/security-updates.sh
```

```bash
#!/bin/bash
# Security updates script

# Update package lists
apt update

# Install security updates
apt upgrade -y

# Update Composer dependencies
cd /var/www/real-estate-platform
sudo -u www-data composer update --no-dev

# Clear and rebuild caches
sudo -u www-data php artisan cache:clear
sudo -u www-data php artisan config:cache
sudo -u www-data php artisan route:cache
sudo -u www-data php artisan view:cache

# Restart services
systemctl restart php8.1-fpm
systemctl restart nginx
supervisorctl restart real-estate-platform-worker:*

echo "Security updates completed on $(date)"
```

---

## Deployment Checklist

### Pre-Deployment
- [ ] Server meets minimum requirements
- [ ] Domain name configured and pointing to server
- [ ] SSL certificate obtained and configured
- [ ] Database created and configured
- [ ] Environment variables configured
- [ ] Payment gateway credentials configured
- [ ] Email service configured
- [ ] File storage configured

### Deployment
- [ ] Application code deployed
- [ ] Dependencies installed
- [ ] Database migrated
- [ ] File permissions set correctly
- [ ] Web server configured
- [ ] Queue workers configured
- [ ] Cron jobs configured
- [ ] Caching configured

### Post-Deployment
- [ ] Application accessible via HTTPS
- [ ] All features tested
- [ ] Payment gateways tested
- [ ] Email notifications working
- [ ] Queue workers running
- [ ] Backups configured
- [ ] Monitoring configured
- [ ] Security hardening applied

### Performance Optimization
- [ ] Application caches enabled
- [ ] Database optimized
- [ ] CDN configured (if applicable)
- [ ] Image optimization enabled
- [ ] Gzip compression enabled
- [ ] Browser caching configured

This comprehensive deployment guide ensures a secure, scalable, and maintainable production environment for the Real Estate Investment Platform.