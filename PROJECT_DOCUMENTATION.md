# ChainCity - Real Estate Investment Platform
## Complete Project Documentation

## 📋 Table of Contents
1. [Project Overview](#project-overview)
2. [Core Features](#core-features)
3. [Technical Architecture](#technical-architecture)
4. [Installation Guide](#installation-guide)
5. [Configuration Guide](#configuration-guide)
6. [API Documentation](#api-documentation)
7. [Admin Panel Guide](#admin-panel-guide)
8. [User Guide](#user-guide)
9. [Developer Guide](#developer-guide)
10. [Deployment Guide](#deployment-guide)

## 🏢 Project Overview

ChainCity is a comprehensive real estate investment platform built with Laravel 11 that enables fractional property investment, portfolio management, and automated returns distribution.

### Key Statistics
- **Framework**: Laravel 11.23.0
- **PHP Version**: 8.1+
- **Payment Gateways**: 20+ integrated
- **Languages**: Multi-language support
- **Themes**: 2 responsive themes (Light & Green)
- **Authentication**: Multi-method (Email, Social, 2FA)

### Business Model
The platform facilitates real estate investments by allowing users to:
- Browse and invest in listed properties
- Earn returns on investments
- Participate in referral programs
- Achieve ranks and earn bonuses
- Trade property shares with other investors

## ✨ Core Features

### 1. Property Investment System

#### Property Management
- **Listing Features**:
  - Comprehensive property profiles
  - Multiple image galleries
  - Amenity listings
  - Location mapping
  - Investment terms and conditions
  - FAQ sections

- **Investment Options**:
  - Fixed investment amounts
  - Flexible investment ranges (min-max)
  - Multiple payment methods
  - Instant and manual processing
  - Investment tracking

- **Returns Management**:
  - Automated ROI calculations
  - Scheduled return distributions
  - Return history tracking
  - Performance analytics

#### Property Sharing & Offers
- **Share Trading**:
  - List shares for sale
  - Browse available shares
  - Negotiate prices
  - Secure transactions

- **Offer System**:
  - Make offers on properties
  - Counter-offer negotiations
  - Offer locking mechanism
  - Time-limited offers

### 2. Financial Features

#### Payment Gateway Integration
The platform supports 20+ payment gateways:

**Traditional Payment Methods**:
- Stripe (Cards, 3D Secure)
- PayPal (Balance, Cards)
- Razorpay (Indian payments)
- Authorize.Net (US processing)
- Mollie (European payments)
- Flutterwave (African payments)
- Paystack (Nigerian payments)
- Mercado Pago (Latin America)

**Cryptocurrency Gateways**:
- Coingate (50+ cryptocurrencies)
- CoinPayments (1900+ cryptos)
- Blockchain (Bitcoin)
- BlockIO (BTC, LTC, DOGE)
- Coinbase Commerce
- NowPayments (150+ cryptos)

**Regional Gateways**:
- Instamojo (India)
- CinetPay (West Africa)
- Midtrans (Indonesia)
- Khalti (Nepal)
- VoguePay (Africa)

**Manual Methods**:
- Bank Transfer
- Cash Payment
- Custom payment methods

#### Transaction Management
- **Deposit System**:
  - Multiple currency support
  - Instant processing for automated gateways
  - Manual verification for bank transfers
  - Transaction history and receipts

- **Payout System**:
  - Multiple withdrawal methods
  - Configurable limits and fees
  - Automatic and manual processing
  - Payout scheduling

- **Money Transfer**:
  - User-to-user transfers
  - Transfer limits and fees
  - Security verification
  - Transfer history

### 3. User Management System

#### Authentication & Security
- **Registration Methods**:
  - Email/Password registration
  - Social login (Google, Facebook, Twitter)
  - Phone number verification
  - Email verification

- **Security Features**:
  - Two-factor authentication (2FA)
  - Google Authenticator integration
  - Login history tracking
  - Device management
  - Session management

#### KYC Verification
- **Document Types**:
  - Government ID (Passport, Driver's License, National ID)
  - Proof of Address
  - Bank statements
  - Utility bills

- **Verification Process**:
  - Document upload interface
  - Admin review system
  - Multi-level verification
  - Rejection with feedback
  - Re-submission capability

#### Profile Management
- **User Information**:
  - Personal details management
  - Address management
  - Contact information
  - Notification preferences
  - Language preferences

### 4. Referral & Ranking System

#### Multi-Level Referral Program
- **Features**:
  - Unique referral codes/links
  - Multi-level commission structure
  - Real-time tracking
  - Commission distribution
  - Referral tree visualization

- **Commission Types**:
  - Registration bonuses
  - Investment commissions
  - Activity-based rewards
  - Level-specific rates

#### Ranking System
- **Rank Structure**:
  - Multiple achievement levels
  - Investment-based progression
  - Referral-based progression
  - Combined criteria

- **Rank Benefits**:
  - Higher commission rates
  - Exclusive investment opportunities
  - Priority support
  - Special badges and recognition

### 5. Communication Features

#### Notification System
- **Channels**:
  - In-app notifications
  - Email notifications
  - SMS notifications (Twilio, Nexmo, Infobip)
  - Push notifications (Firebase)

- **Notification Types**:
  - Transaction alerts
  - Investment updates
  - Return distributions
  - System announcements
  - Marketing messages

#### Support Ticket System
- **Features**:
  - Priority-based ticketing
  - Department routing
  - File attachments
  - Ticket history
  - Admin response system
  - Ticket status tracking

### 6. Content Management System

#### Dynamic Pages
- **Page Types**:
  - About Us
  - Terms & Conditions
  - Privacy Policy
  - FAQ
  - Contact Us
  - Custom pages

#### Blog System
- **Features**:
  - Category management
  - Tag system
  - SEO optimization
  - Multi-language support
  - Comment system
  - Social sharing

#### Menu Management
- **Capabilities**:
  - Dynamic menu builder
  - Drag-and-drop interface
  - Multi-level menus
  - Custom links
  - Permission-based visibility

## 🏗️ Technical Architecture

### Technology Stack

#### Backend Technologies
- **Framework**: Laravel 11.23.0
- **PHP**: Version 8.1+
- **Database**: MySQL 5.7+ / PostgreSQL 10+
- **Cache**: Redis / Memcached
- **Queue**: Redis / Database / Sync
- **Session**: File / Database / Redis
- **Broadcasting**: Pusher / Redis

#### Frontend Technologies
- **CSS Framework**: Bootstrap 5.2.3
- **JavaScript**: Vanilla JS, Vue.js (minimal)
- **Build Tool**: Vite 4.0
- **Preprocessor**: SASS
- **Icons**: FontAwesome, Custom SVGs

#### Third-Party Services
- **Payment Processing**: Multiple SDK integrations
- **Email Services**: SMTP, Mailgun, SendGrid, Postmark
- **SMS Services**: Twilio, Nexmo, Infobip, Plivo
- **Push Notifications**: Firebase Cloud Messaging
- **Translation**: Google Translate API
- **Maps**: Google Maps API
- **Image Processing**: Intervention Image
- **Authentication**: Laravel Sanctum
- **Data Tables**: Yajra DataTables

### Database Schema

#### Primary Tables
1. **users** - User accounts and profiles
2. **properties** - Property listings
3. **investments** - User investments
4. **transactions** - Financial transactions
5. **deposits** - Deposit records
6. **payouts** - Withdrawal records
7. **referrals** - Referral relationships
8. **ranks** - User ranking levels
9. **kycs** - KYC verification records
10. **support_tickets** - Support system

#### Supporting Tables
- **admins** - Admin accounts
- **roles** - Permission roles
- **gateways** - Payment gateways
- **languages** - Language settings
- **contents** - CMS content
- **blogs** - Blog posts
- **amenities** - Property amenities
- **addresses** - Location data
- **notifications** - Notification records

### Security Implementation
- **Authentication**: Multi-factor, social login
- **Authorization**: Role-based access control
- **Data Protection**: Encryption, sanitization
- **API Security**: Rate limiting, token auth
- **Payment Security**: PCI compliance
- **File Security**: Upload validation
- **Session Security**: CSRF protection

## 📦 Installation Guide

### Prerequisites
- PHP >= 8.1
- Composer >= 2.0
- Node.js >= 16.x
- MySQL >= 5.7 or PostgreSQL >= 10
- Redis (optional but recommended)

### Step-by-Step Installation

1. **Clone Repository**
```bash
git clone <repository-url>
cd chaincity
```

2. **Install Dependencies**
```bash
composer install
npm install
```

3. **Environment Setup**
```bash
cp .env.example .env
php artisan key:generate
```

4. **Database Configuration**
Edit `.env` file:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=chaincity
DB_USERNAME=root
DB_PASSWORD=yourpassword
```

5. **Run Migrations**
```bash
php artisan migrate
php artisan db:seed # Optional: seed sample data
```

6. **Build Assets**
```bash
npm run build
```

7. **Set Permissions**
```bash
chmod -R 775 storage bootstrap/cache
```

8. **Start Development Server**
```bash
php artisan serve
```

## ⚙️ Configuration Guide

### Essential Configurations

#### Application Settings
```env
APP_NAME="ChainCity"
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost:8000
```

#### Mail Configuration
```env
MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
```

#### Payment Gateways
Configure each gateway in `.env`:
```env
# Stripe
STRIPE_KEY=pk_test_xxx
STRIPE_SECRET=sk_test_xxx

# PayPal
PAYPAL_CLIENT_ID=xxx
PAYPAL_SECRET=xxx
```

#### Firebase Setup
```env
FIREBASE_PROJECT_ID=your-project-id
FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n"
FIREBASE_CLIENT_EMAIL=firebase-adminsdk@project.iam.gserviceaccount.com
```

#### SMS Configuration
```env
# Twilio
TWILIO_SID=ACxxxxx
TWILIO_TOKEN=xxxxx
TWILIO_FROM=+1234567890
```

## 🔌 API Documentation

### Base URL
```
https://yourdomain.com/api
```

### Authentication
All API requests require Bearer token authentication:
```
Authorization: Bearer {token}
```

### Main Endpoints

#### Authentication
- `POST /register` - User registration
- `POST /login` - User login
- `POST /logout` - User logout
- `POST /password/reset` - Password reset

#### Properties
- `GET /properties` - List all properties
- `GET /property/{id}` - Get property details
- `POST /property/invest` - Make investment
- `GET /property/{id}/shares` - Get available shares

#### User Profile
- `GET /profile` - Get user profile
- `PUT /profile` - Update profile
- `POST /profile/avatar` - Upload avatar
- `POST /kyc/upload` - Upload KYC documents

#### Investments
- `GET /investments` - List user investments
- `GET /investment/{id}` - Investment details
- `GET /investment/{id}/returns` - Return history

#### Transactions
- `GET /transactions` - Transaction history
- `POST /deposit` - Create deposit
- `POST /payout` - Request payout
- `POST /transfer` - Money transfer

#### Referrals
- `GET /referrals` - Referral list
- `GET /referral/tree` - Referral tree
- `GET /referral/commissions` - Commission history

## 👨‍💼 Admin Panel Guide

### Dashboard Overview
The admin dashboard provides:
- Real-time statistics
- User analytics
- Investment tracking
- Revenue reports
- System health monitoring

### Key Admin Features

#### User Management
- View/edit user profiles
- Balance adjustments
- Account suspension
- KYC verification
- Activity logs

#### Property Management
- Add/edit properties
- Image management
- Investment tracking
- Return distribution
- Property analytics

#### Financial Management
- Deposit processing
- Payout approval
- Transaction monitoring
- Fee configuration
- Currency management

#### System Configuration
- General settings
- Email configuration
- SMS settings
- Payment gateways
- Language management

## 👤 User Guide

### Getting Started
1. Register account
2. Verify email
3. Complete KYC
4. Make first deposit
5. Browse properties
6. Make investment

### Investment Process
1. Browse available properties
2. Review property details
3. Calculate potential returns
4. Select investment amount
5. Choose payment method
6. Confirm transaction
7. Track investment

### Managing Investments
- View portfolio dashboard
- Track returns
- Monitor performance
- Request payouts
- Reinvest returns

## 🔧 Developer Guide

### Development Setup
```bash
# Install dependencies
composer install
npm install

# Start development servers
php artisan serve
npm run dev

# Run tests
php artisan test
```

### Code Structure
- Follow PSR-12 standards
- Use Laravel conventions
- Implement service patterns
- Write unit tests
- Document code

### Creating New Features
1. Plan database schema
2. Create migrations
3. Build models
4. Implement services
5. Create controllers
6. Add routes
7. Build views
8. Write tests

## 🚀 Deployment Guide

### Production Setup

#### Server Requirements
- Ubuntu 20.04+ / CentOS 8+
- Nginx or Apache
- PHP 8.1+ with extensions
- MySQL 8.0+ / PostgreSQL 13+
- Redis 6.0+
- SSL certificate

#### Deployment Steps
1. Clone repository to server
2. Install dependencies
3. Configure environment
4. Run migrations
5. Build assets
6. Configure web server
7. Set up SSL
8. Configure cron jobs
9. Start queue workers
10. Enable monitoring

#### Optimization
```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan optimize
```

---

**Version**: 1.0.0  
**Last Updated**: January 2025  
**Platform**: ChainCity Real Estate Investment