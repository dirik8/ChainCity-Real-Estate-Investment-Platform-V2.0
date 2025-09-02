# ChainCity Database Schema Documentation

## Overview
The ChainCity platform uses MySQL/PostgreSQL as its primary database. The schema is designed to support real estate investment operations, user management, financial transactions, and content management.

## Database Design Principles
- **Normalization**: Tables are normalized to 3NF to reduce redundancy
- **Soft Deletes**: Critical tables use soft deletes for data recovery
- **UUID/Incremental IDs**: Primary keys use auto-incrementing integers
- **Timestamps**: All tables include created_at and updated_at
- **Foreign Keys**: Enforced referential integrity
- **Indexes**: Optimized for common queries

---

## Core Tables

### 1. users
Main user table for investors and platform users.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| firstname | varchar(255) | User's first name |
| lastname | varchar(255) | User's last name |
| username | varchar(50) | Unique username |
| email | varchar(255) | Unique email address |
| country_code | varchar(10) | Phone country code |
| phone | varchar(20) | Phone number |
| password | varchar(255) | Hashed password |
| balance | decimal(28,8) | Available balance |
| investment_balance | decimal(28,8) | Invested amount |
| total_invest | decimal(28,8) | Total investments made |
| total_return | decimal(28,8) | Total returns earned |
| rank_id | bigint | Foreign key to ranks |
| referral_by | bigint | Referrer user ID |
| referral_code | varchar(50) | Unique referral code |
| image | varchar(255) | Profile image path |
| email_verified_at | timestamp | Email verification time |
| sms_verified_at | timestamp | SMS verification time |
| kyc_verified_at | timestamp | KYC verification time |
| status | tinyint | Account status (0=inactive, 1=active) |
| two_fa | tinyint | 2FA enabled (0=no, 1=yes) |
| two_fa_secret | varchar(255) | 2FA secret key |
| provider | varchar(255) | Social login provider |
| provider_id | varchar(255) | Social provider ID |
| remember_token | varchar(100) | Remember me token |
| created_at | timestamp | Registration date |
| updated_at | timestamp | Last update |

**Indexes:**
- Primary: id
- Unique: email, username, referral_code
- Index: referral_by, rank_id, status

**Relationships:**
- Has many: investments, transactions, deposits, payouts
- Has one: kyc, user_login
- Belongs to: rank

---

### 2. properties
Property listings available for investment.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| title | varchar(255) | Property title |
| slug | varchar(255) | URL-friendly slug |
| description | text | Detailed description |
| property_type | varchar(100) | Type (Residential/Commercial) |
| size | varchar(100) | Property size |
| bedrooms | integer | Number of bedrooms |
| bathrooms | integer | Number of bathrooms |
| address_id | bigint | Foreign key to addresses |
| amenity_id | json | Array of amenity IDs |
| fixed_amount | decimal(28,8) | Fixed investment amount |
| minimum_amount | decimal(28,8) | Minimum investment |
| maximum_amount | decimal(28,8) | Maximum investment |
| total_investment_amount | decimal(28,8) | Target amount |
| current_investment_amount | decimal(28,8) | Amount raised |
| profit_return_type | varchar(50) | Return type (monthly/yearly) |
| profit_return | decimal(8,2) | Return percentage |
| how_many_days | integer | Investment period |
| start_date | date | Investment start date |
| expire_date | date | Investment end date |
| status | tinyint | Status (0=inactive, 1=active) |
| is_featured | tinyint | Featured property |
| is_invest | tinyint | Open for investment |
| faq | json | FAQ data |
| total_reviews | integer | Review count |
| average_rating | decimal(3,2) | Average rating |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |
| deleted_at | timestamp | Soft delete timestamp |

**Indexes:**
- Primary: id
- Unique: slug
- Index: address_id, status, is_featured, is_invest
- Full-text: title, description

**Relationships:**
- Has many: investments, images, property_shares, property_offers
- Belongs to: address
- Has many through: users (investors)

---

### 3. investments
User investments in properties.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | Foreign key to users |
| property_id | bigint | Foreign key to properties |
| transaction_id | varchar(100) | Unique transaction ID |
| amount | decimal(28,8) | Investment amount |
| profit_return | decimal(8,2) | Return percentage |
| total_return | decimal(28,8) | Total expected return |
| returned_amount | decimal(28,8) | Amount already returned |
| remaining_amount | decimal(28,8) | Remaining returns |
| return_type | varchar(50) | Return schedule type |
| return_date | date | Next return date |
| last_return_date | date | Last return paid |
| status | tinyint | Status (0=pending, 1=active, 2=completed) |
| is_locked | tinyint | Investment locked |
| created_at | timestamp | Investment date |
| updated_at | timestamp | Last update |

**Indexes:**
- Primary: id
- Unique: transaction_id
- Index: user_id, property_id, status, return_date

**Relationships:**
- Belongs to: user, property
- Has many: transactions

---

### 4. transactions
All financial transactions in the system.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | Foreign key to users |
| amount | decimal(28,8) | Transaction amount |
| charge | decimal(28,8) | Transaction fee |
| final_amount | decimal(28,8) | Final amount after fees |
| trx_type | varchar(20) | Transaction direction (+/-) |
| trx_id | varchar(100) | Unique transaction ID |
| remarks | varchar(255) | Transaction description |
| type | varchar(50) | Transaction type |
| reference_id | bigint | Related entity ID |
| reference_type | varchar(255) | Related entity type |
| created_at | timestamp | Transaction date |
| updated_at | timestamp | Last update |

**Transaction Types:**
- deposit
- withdrawal
- investment
- investment_return
- referral_bonus
- rank_bonus
- transfer_in
- transfer_out
- admin_adjustment

**Indexes:**
- Primary: id
- Unique: trx_id
- Index: user_id, type, reference_id, reference_type
- Index: created_at

**Relationships:**
- Belongs to: user
- Morphable: reference (investment, deposit, payout, etc.)

---

### 5. deposits
User deposit records for adding funds.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | Foreign key to users |
| gateway_id | bigint | Foreign key to gateways |
| deposit_number | varchar(100) | Unique deposit number |
| amount | decimal(28,8) | Deposit amount |
| percentage_charge | decimal(8,2) | Percentage fee |
| fixed_charge | decimal(28,8) | Fixed fee |
| charge | decimal(28,8) | Total fee |
| final_amount | decimal(28,8) | Amount after fees |
| payable_amount | decimal(28,8) | Amount to pay |
| base_currency | varchar(10) | Base currency |
| payment_currency | varchar(10) | Payment currency |
| exchange_rate | decimal(28,8) | Exchange rate |
| btc_amount | decimal(28,8) | BTC equivalent |
| btc_wallet | varchar(255) | BTC address |
| transaction_id | varchar(255) | Gateway transaction ID |
| status | tinyint | Status (0=pending, 1=complete, 2=failed) |
| payment_response | text | Gateway response |
| created_at | timestamp | Deposit date |
| updated_at | timestamp | Last update |

**Indexes:**
- Primary: id
- Unique: deposit_number
- Index: user_id, gateway_id, status
- Index: created_at

**Relationships:**
- Belongs to: user, gateway
- Has one: transaction

---

### 6. payouts
Withdrawal/payout requests from users.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | Foreign key to users |
| method_id | bigint | Foreign key to payout_methods |
| transaction_id | varchar(100) | Unique transaction ID |
| amount | decimal(28,8) | Requested amount |
| charge | decimal(28,8) | Payout fee |
| net_amount | decimal(28,8) | Amount after fees |
| information | json | Payout details |
| currency | varchar(10) | Payout currency |
| status | tinyint | Status (0=pending, 1=approved, 2=rejected) |
| feedback | text | Admin feedback |
| processed_by | bigint | Admin who processed |
| processed_at | timestamp | Processing time |
| created_at | timestamp | Request date |
| updated_at | timestamp | Last update |

**Indexes:**
- Primary: id
- Unique: transaction_id
- Index: user_id, method_id, status
- Index: created_at

**Relationships:**
- Belongs to: user, payout_method, admin (processed_by)
- Has one: transaction

---

### 7. referrals
Referral relationships between users.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| referrer_id | bigint | User who referred |
| referred_id | bigint | User who was referred |
| level | integer | Referral level (1, 2, 3, etc.) |
| created_at | timestamp | Referral date |
| updated_at | timestamp | Last update |

**Indexes:**
- Primary: id
- Unique: referrer_id + referred_id
- Index: referrer_id, referred_id, level

**Relationships:**
- Belongs to: referrer (user), referred (user)

---

### 8. referral_bonuses
Referral commission records.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | User receiving bonus |
| from_user_id | bigint | User generating bonus |
| level | integer | Referral level |
| amount | decimal(28,8) | Bonus amount |
| commission_type | varchar(50) | Type of commission |
| reference_id | bigint | Related entity ID |
| reference_type | varchar(255) | Related entity type |
| created_at | timestamp | Bonus date |
| updated_at | timestamp | Last update |

**Commission Types:**
- registration
- investment
- deposit
- activity

**Indexes:**
- Primary: id
- Index: user_id, from_user_id, level
- Index: reference_id, reference_type

**Relationships:**
- Belongs to: user, from_user
- Morphable: reference

---

### 9. ranks
User ranking levels and requirements.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| name | varchar(100) | Rank name |
| slug | varchar(100) | URL slug |
| icon | varchar(255) | Rank icon/badge |
| level | integer | Rank level number |
| minimum_investment | decimal(28,8) | Required investment |
| minimum_referrals | integer | Required referrals |
| minimum_team_investment | decimal(28,8) | Team investment |
| bonus_percentage | decimal(8,2) | Bonus rate |
| benefits | json | Rank benefits |
| status | tinyint | Active status |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Indexes:**
- Primary: id
- Unique: slug, level
- Index: status

**Relationships:**
- Has many: users

---

### 10. kycs
KYC verification documents and status.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | Foreign key to users |
| document_type | varchar(50) | Type of document |
| front_image | varchar(255) | Front document image |
| back_image | varchar(255) | Back document image |
| selfie_image | varchar(255) | Selfie with document |
| document_number | varchar(100) | Document ID number |
| status | tinyint | Status (0=pending, 1=approved, 2=rejected) |
| rejection_reason | text | Reason for rejection |
| verified_by | bigint | Admin who verified |
| verified_at | timestamp | Verification time |
| created_at | timestamp | Submission date |
| updated_at | timestamp | Last update |

**Document Types:**
- passport
- driving_license
- national_id
- voter_id

**Indexes:**
- Primary: id
- Unique: user_id
- Index: status, document_type

**Relationships:**
- Belongs to: user, admin (verified_by)

---

## Supporting Tables

### 11. admins
Administrator accounts for platform management.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| name | varchar(255) | Admin name |
| username | varchar(50) | Unique username |
| email | varchar(255) | Unique email |
| password | varchar(255) | Hashed password |
| image | varchar(255) | Profile image |
| role_id | bigint | Foreign key to roles |
| status | tinyint | Active status |
| two_fa | tinyint | 2FA enabled |
| two_fa_secret | varchar(255) | 2FA secret |
| last_login | timestamp | Last login time |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: role
- Has many: activities, processed_payouts

---

### 12. roles
Permission roles for administrators.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| name | varchar(100) | Role name |
| slug | varchar(100) | URL slug |
| permissions | json | Permission array |
| status | tinyint | Active status |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Relationships:**
- Has many: admins

---

### 13. gateways
Payment gateway configurations.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| code | varchar(50) | Gateway code |
| name | varchar(100) | Gateway name |
| alias | varchar(100) | Gateway alias |
| image | varchar(255) | Gateway logo |
| status | tinyint | Active status |
| parameters | json | API parameters |
| supported_currencies | json | Currency list |
| crypto | tinyint | Is cryptocurrency |
| description | text | Gateway description |
| input_form | json | Custom input fields |
| percentage_charge | decimal(8,2) | Percentage fee |
| fixed_charge | decimal(28,8) | Fixed fee |
| min_amount | decimal(28,8) | Minimum amount |
| max_amount | decimal(28,8) | Maximum amount |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Relationships:**
- Has many: deposits

---

### 14. payout_methods
Available withdrawal methods.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| name | varchar(100) | Method name |
| code | varchar(50) | Method code |
| description | text | Method description |
| image | varchar(255) | Method logo |
| status | tinyint | Active status |
| input_form | json | Required fields |
| percentage_charge | decimal(8,2) | Percentage fee |
| fixed_charge | decimal(28,8) | Fixed fee |
| min_amount | decimal(28,8) | Minimum amount |
| max_amount | decimal(28,8) | Maximum amount |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Relationships:**
- Has many: payouts

---

### 15. support_tickets
Customer support ticket system.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | Foreign key to users |
| ticket_number | varchar(100) | Unique ticket number |
| subject | varchar(255) | Ticket subject |
| priority | varchar(20) | Priority level |
| department | varchar(50) | Department |
| status | tinyint | Status (0=open, 1=answered, 2=closed) |
| last_reply | timestamp | Last reply time |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Priority Levels:**
- low
- medium
- high
- urgent

**Relationships:**
- Belongs to: user
- Has many: support_ticket_messages, support_ticket_attachments

---

### 16. support_ticket_messages
Messages within support tickets.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| ticket_id | bigint | Foreign key to support_tickets |
| admin_id | bigint | Admin ID (if admin reply) |
| message | text | Message content |
| created_at | timestamp | Message date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: support_ticket, admin

---

### 17. property_shares
Property share trading between users.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| property_id | bigint | Foreign key to properties |
| seller_id | bigint | Selling user ID |
| buyer_id | bigint | Buying user ID |
| share_percentage | decimal(5,2) | Share percentage |
| price | decimal(28,8) | Share price |
| status | tinyint | Status (0=available, 1=sold, 2=cancelled) |
| created_at | timestamp | Listing date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: property, seller (user), buyer (user)

---

### 18. property_offers
Offers made on properties.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| property_id | bigint | Foreign key to properties |
| user_id | bigint | Offering user ID |
| amount | decimal(28,8) | Offer amount |
| share_percentage | decimal(5,2) | Requested shares |
| message | text | Offer message |
| status | tinyint | Status (0=pending, 1=accepted, 2=rejected, 3=counter) |
| counter_amount | decimal(28,8) | Counter offer amount |
| expires_at | timestamp | Offer expiration |
| created_at | timestamp | Offer date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: property, user
- Has many: offer_replies

---

### 19. languages
Multi-language support configuration.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| name | varchar(100) | Language name |
| code | varchar(10) | Language code (en, es, fr) |
| flag | varchar(255) | Flag image |
| rtl | tinyint | Right-to-left |
| status | tinyint | Active status |
| default | tinyint | Default language |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Relationships:**
- Has many: content_details

---

### 20. contents
CMS content management.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| name | varchar(100) | Content identifier |
| title | varchar(255) | Content title |
| slug | varchar(255) | URL slug |
| type | varchar(50) | Content type |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Content Types:**
- page
- section
- component
- widget

**Relationships:**
- Has many: content_details

---

### 21. content_details
Multilingual content details.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| content_id | bigint | Foreign key to contents |
| language_id | bigint | Foreign key to languages |
| title | varchar(255) | Translated title |
| description | text | Translated content |
| meta_title | varchar(255) | SEO meta title |
| meta_description | text | SEO meta description |
| meta_keywords | text | SEO keywords |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: content, language

---

### 22. blogs
Blog post management.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| category_id | bigint | Foreign key to blog_categories |
| title | varchar(255) | Blog title |
| slug | varchar(255) | URL slug |
| author | varchar(100) | Author name |
| image | varchar(255) | Featured image |
| status | tinyint | Published status |
| views | integer | View count |
| created_at | timestamp | Publication date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: blog_category
- Has many: blog_details

---

### 23. amenities
Property amenity definitions.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| name | varchar(100) | Amenity name |
| icon | varchar(255) | Icon class/image |
| status | tinyint | Active status |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to many: properties

---

### 24. addresses
Location/address management.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| street | varchar(255) | Street address |
| city | varchar(100) | City |
| state | varchar(100) | State/Province |
| country | varchar(100) | Country |
| zip | varchar(20) | ZIP/Postal code |
| latitude | decimal(10,8) | GPS latitude |
| longitude | decimal(11,8) | GPS longitude |
| created_at | timestamp | Creation date |
| updated_at | timestamp | Last update |

**Relationships:**
- Has many: properties

---

### 25. fire_base_tokens
Push notification device tokens.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | Foreign key to users |
| token | text | Device token |
| device_type | varchar(20) | Device type (ios/android/web) |
| created_at | timestamp | Registration date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: user

---

### 26. in_app_notifications
In-app notification records.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| user_id | bigint | Foreign key to users |
| title | varchar(255) | Notification title |
| message | text | Notification message |
| type | varchar(50) | Notification type |
| is_read | tinyint | Read status |
| data | json | Additional data |
| created_at | timestamp | Notification date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: user

---

### 27. money_transfers
User-to-user money transfers.

| Column | Type | Description |
|--------|------|-------------|
| id | bigint | Primary key |
| sender_id | bigint | Sending user ID |
| receiver_id | bigint | Receiving user ID |
| amount | decimal(28,8) | Transfer amount |
| charge | decimal(28,8) | Transfer fee |
| transaction_id | varchar(100) | Transaction ID |
| note | text | Transfer note |
| status | tinyint | Transfer status |
| created_at | timestamp | Transfer date |
| updated_at | timestamp | Last update |

**Relationships:**
- Belongs to: sender (user), receiver (user)

---

## Database Indexes Strategy

### Performance Optimization
1. **Primary Keys**: All tables use indexed primary keys
2. **Foreign Keys**: Indexed for JOIN operations
3. **Unique Constraints**: Email, username, transaction IDs
4. **Composite Indexes**: Multi-column indexes for complex queries
5. **Full-text Indexes**: Search functionality on text fields

### Common Query Patterns
```sql
-- User investments
INDEX idx_user_property ON investments(user_id, property_id);

-- Transaction history
INDEX idx_user_date ON transactions(user_id, created_at);

-- Property search
FULLTEXT INDEX ft_property_search ON properties(title, description);

-- Active investments by return date
INDEX idx_active_returns ON investments(status, return_date);
```

---

## Migration Strategy

### Initial Setup
```bash
php artisan migrate:fresh --seed
```

### Production Migrations
```bash
php artisan migrate --force
```

### Rollback
```bash
php artisan migrate:rollback --step=1
```

---

## Database Maintenance

### Regular Tasks
1. **Backup**: Daily automated backups
2. **Optimization**: Weekly table optimization
3. **Cleanup**: Monthly soft-deleted records cleanup
4. **Archiving**: Yearly transaction archiving

### Performance Monitoring
- Query performance analysis
- Slow query log monitoring
- Index usage statistics
- Table size monitoring

---

**Database Version**: MySQL 8.0 / PostgreSQL 13+  
**Schema Version**: 1.0  
**Last Updated**: January 2025