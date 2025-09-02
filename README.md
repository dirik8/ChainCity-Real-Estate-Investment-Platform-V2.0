# Real Estate Investment Platform

A comprehensive Laravel-based real estate investment platform that enables fractional property investment, portfolio management, and automated returns distribution. This platform connects investors with real estate opportunities through a modern, secure, and feature-rich web application.

![Laravel](https://img.shields.io/badge/Laravel-11.x-red)
![PHP](https://img.shields.io/badge/PHP-8.1+-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## 🏢 About This Project

This Real Estate Investment Platform revolutionizes property investment by allowing users to:
- **Fractional Investment**: Invest in properties with flexible amounts
- **Portfolio Management**: Track and manage multiple property investments
- **Automated Returns**: Receive regular returns based on property performance
- **Social Features**: Refer friends and earn commissions
- **Multi-language Support**: Available in multiple languages
- **Mobile API**: Full mobile app integration support

## ✨ Key Features

### 🏠 Property Investment System
- **Property Listings**: Browse detailed property information with images, amenities, and investment terms
- **Flexible Investment**: Choose between fixed amounts or flexible investment ranges
- **Investment Tracking**: Monitor your investments, returns, and performance
- **Property Sharing**: Share property investments with other users
- **Property Offers**: Make and receive offers on property investments
- **Automated Returns**: Calculate and distribute returns based on property performance

### 👥 User Management
- **Multi-Role System**: Support for users, admins, and custom roles
- **Advanced Authentication**: Email/SMS verification, 2FA, social login
- **KYC Verification**: Complete identity and address verification system
- **User Profiles**: Comprehensive user profiles with investment history
- **Referral System**: Multi-level referral program with commissions
- **Ranking System**: User ranking based on investment activity

### 💳 Payment & Financial System
- **35+ Payment Gateways**: Support for major payment providers worldwide
- **Multi-Currency**: Support for multiple currencies and exchange rates
- **Deposit System**: Secure deposit management with automatic processing
- **Withdrawal System**: Flexible payout methods and processing
- **Transaction Logging**: Complete financial transaction history
- **Money Transfer**: Internal user-to-user money transfers

### 🔧 Administrative Features
- **Comprehensive Dashboard**: Real-time analytics and reporting
- **Property Management**: Add, edit, and manage property listings
- **User Management**: Complete user account management
- **Financial Management**: Monitor all financial transactions and payouts
- **Content Management**: Manage website content, pages, and blog
- **System Configuration**: Extensive system settings and customization
- **Multi-language Management**: Manage translations and language packs

### 📱 API & Mobile Support
- **RESTful API**: Complete API for mobile app integration
- **Push Notifications**: Firebase-based push notifications
- **Real-time Updates**: Live updates for investments and transactions
- **Mobile-First Design**: Responsive design optimized for mobile devices

### 🛡️ Security & Compliance
- **Advanced Security**: 2FA, email/SMS verification, secure sessions
- **KYC/AML Compliance**: Complete identity verification workflow
- **Data Protection**: Secure data handling and privacy protection
- **Role-Based Access**: Granular permission system
- **Audit Logging**: Complete activity and transaction logging

## 🚀 Supported Payment Gateways

The platform supports 35+ payment gateways including:

**Credit/Debit Cards:**
- Stripe, Razorpay, PayPal, Authorize.Net, 2Checkout

**Digital Wallets:**
- PayPal, Skrill, Perfect Money, Payeer, Mollie

**Cryptocurrency:**
- Coinbase Commerce, CoinGate, CoinPayments, Binance, Blockchain

**Regional Gateways:**
- Flutterwave (Africa), Khalti (Nepal), Instamojo (India), PayStack (Africa)
- Midtrans (Indonesia), PayTM (India), CinetPay (Africa), Monnify (Nigeria)

**Bank Transfers:**
- Direct bank transfers, SEPA, ACH, and local banking methods

## 📋 Prerequisites

- **PHP**: 8.1 or higher
- **Composer**: Latest version
- **Node.js**: 16.x or higher
- **Database**: MySQL 8.0+ or PostgreSQL 13+
- **Web Server**: Apache/Nginx
- **SSL Certificate**: Required for production

## ⚡ Quick Installation

### 1. Clone Repository
```bash
git clone [repository-url]
cd real-estate-investment-platform
```

### 2. Install Dependencies
```bash
# Install PHP dependencies
composer install

# Install Node.js dependencies
npm install
```

### 3. Environment Setup
```bash
# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate
```

### 4. Database Setup
```bash
# Configure database in .env file
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database
DB_USERNAME=your_username
DB_PASSWORD=your_password

# Run migrations
php artisan migrate

# Seed database (optional)
php artisan db:seed
```

### 5. Storage Setup
```bash
# Create symbolic link for storage
php artisan storage:link

# Set permissions
chmod -R 755 storage bootstrap/cache
```

### 6. Build Assets
```bash
# Build frontend assets
npm run build

# For development
npm run dev
```

### 7. Start Server
```bash
# Start development server
php artisan serve

# Or configure with Apache/Nginx
```

## 🔧 Configuration

### Essential Settings

#### 1. Basic Configuration
- **Site Settings**: Configure site name, logo, and basic information
- **Currency**: Set primary currency and supported currencies
- **Time Zone**: Configure application timezone
- **Language**: Set default language and enable multi-language support

#### 2. Payment Gateway Configuration
Configure your preferred payment gateways in the admin panel:
- Navigate to `Admin > Payment Methods`
- Enable and configure desired payment gateways
- Set processing fees and limits

#### 3. Email Configuration
```env
MAIL_MAILER=smtp
MAIL_HOST=your-smtp-host
MAIL_PORT=587
MAIL_USERNAME=your-email
MAIL_PASSWORD=your-password
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=noreply@yourdomain.com
```

#### 4. SMS Configuration
Configure SMS providers for verification:
- Twilio, Vonage, Plivo, or custom SMS gateways
- Set up in `Admin > SMS Configuration`

#### 5. Firebase Setup (Push Notifications)
```javascript
// Update firebase-messaging-sw.js
const firebaseConfig = {
    apiKey: "your-api-key",
    authDomain: "your-domain.firebaseapp.com",
    projectId: "your-project-id",
    // ... other config
};
```

## 📖 Usage Guide

For detailed usage instructions, see our comprehensive guides:
- [Property Investment Guide](Documentation/PROPERTY_INVESTMENT.md)
- [User Management Guide](Documentation/USER_MANAGEMENT.md)
- [Admin Guide](Documentation/ADMIN_GUIDE.md)
- [API Documentation](Documentation/API_DOCUMENTATION.md)
- [Payment System Guide](Documentation/PAYMENT_SYSTEM.md)

## 🔌 API Overview

### Authentication
```http
POST /api/login
Content-Type: application/json

{
    "email": "user@example.com",
    "password": "password"
}
```

### Key Endpoints
- **Properties**: `/api/properties` - Browse and invest in properties
- **Investments**: `/api/investments` - Manage user investments
- **Transactions**: `/api/transactions` - Financial transaction history
- **User Profile**: `/api/user/profile` - User account management

For complete API documentation, see [API_DOCUMENTATION.md](Documentation/API_DOCUMENTATION.md).

## 🚀 Deployment

### Production Checklist
- [ ] Configure production environment variables
- [ ] Set up SSL certificate
- [ ] Configure database with backups
- [ ] Set up queue workers
- [ ] Configure caching (Redis recommended)
- [ ] Set up monitoring and logging
- [ ] Configure email and SMS services
- [ ] Test payment gateways

See [DEPLOYMENT.md](Documentation/DEPLOYMENT.md) for detailed deployment instructions.

## 🧪 Testing

```bash
# Run all tests
php artisan test

# Run with coverage
php artisan test --coverage
```

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](Documentation/CONTRIBUTING.md) for guidelines.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Documentation**: Check our comprehensive documentation
- **Issues**: Report bugs via GitHub issues
- **Community**: Join our community discussions

---

## 📊 System Architecture

### Technology Stack
- **Backend**: Laravel 11.x (PHP 8.1+)
- **Frontend**: Bootstrap 5, SCSS, JavaScript
- **Database**: MySQL/PostgreSQL
- **Caching**: Redis (recommended)
- **Queue**: Redis/Database
- **Storage**: Local/AWS S3/DigitalOcean Spaces
- **Notifications**: Firebase, Email, SMS

### Key Components
- **Property Management**: Core investment property handling
- **User System**: Authentication, KYC, and profile management
- **Payment Processing**: Multi-gateway payment handling
- **Investment Engine**: Investment tracking and returns calculation
- **Notification System**: Multi-channel notifications
- **Admin Panel**: Comprehensive administrative interface

---

*This platform provides everything needed for a complete real estate investment solution, from individual property investments to comprehensive portfolio management.*
