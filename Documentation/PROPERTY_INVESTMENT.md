# Property Investment System Documentation

This document provides comprehensive information about the property investment system, which is the core functionality of the Real Estate Investment Platform.

## Table of Contents

1. [Overview](#overview)
2. [Property Management](#property-management)
3. [Investment Process](#investment-process)
4. [Property Features](#property-features)
5. [Investment Types](#investment-types)
6. [Returns & Dividends](#returns--dividends)
7. [Property Sharing](#property-sharing)
8. [Property Offers](#property-offers)
9. [API Endpoints](#api-endpoints)
10. [Database Schema](#database-schema)

## Overview

The Property Investment System allows users to invest in real estate properties with fractional ownership. The system supports various investment models, automated return calculations, and comprehensive property management features.

### Key Features
- **Fractional Investment**: Invest in properties with flexible amounts
- **Property Portfolio**: Manage multiple property investments
- **Automated Returns**: Calculate and distribute returns based on property performance
- **Investment Tracking**: Monitor investment performance and history
- **Property Sharing**: Share investments with other users
- **Offer System**: Make and receive offers on property investments

## Property Management

### Property Creation

Properties are created and managed through the admin panel with the following key attributes:

#### Basic Information
- **Property Title**: Descriptive name of the property
- **Property Type**: Residential, Commercial, Industrial, etc.
- **Location**: Complete address with coordinates
- **Property Value**: Total property value
- **Investment Terms**: Minimum/maximum investment amounts

#### Investment Configuration
```php
// Property investment settings
$property = new Property([
    'title' => 'Luxury Downtown Apartment',
    'property_type' => 'residential',
    'total_value' => 500000.00,
    'minimum_amount' => 1000.00,
    'maximum_amount' => 50000.00,
    'fixed_amount' => null, // null for flexible, amount for fixed
    'expected_return_rate' => 8.5, // Annual percentage
    'investment_period' => 12, // months
]);
```

#### Property Status
- **Active**: Available for investment
- **Funded**: Fully funded, no longer accepting investments
- **Completed**: Investment period ended
- **Cancelled**: Investment cancelled

### Property Images and Media

Properties support multiple images and media files:
- **Property Images**: Multiple high-quality images
- **Virtual Tours**: 360° virtual property tours
- **Documents**: Property documents, certificates, etc.
- **Floor Plans**: Architectural drawings and layouts

### Amenities and Features

Properties can have multiple amenities:
```php
// Amenity management
$property->amenities()->attach([
    'swimming_pool',
    'gym',
    'parking',
    'security',
    'garden'
]);
```

## Investment Process

### Step 1: Browse Properties

Users can browse available properties with filtering options:
- **Location**: Filter by city, state, or region
- **Property Type**: Residential, commercial, etc.
- **Investment Amount**: Filter by minimum investment
- **Expected Returns**: Filter by return rate
- **Investment Period**: Filter by duration

### Step 2: Property Details

Each property displays comprehensive information:
- **Property Overview**: Description, location, specifications
- **Investment Terms**: Minimum amount, expected returns, period
- **Financial Projections**: Expected returns, cash flow projections
- **Property Images**: High-quality images and virtual tours
- **Investment Progress**: Current funding status

### Step 3: Investment Calculation

The system provides investment calculators:
```javascript
// Investment calculation example
function calculateInvestmentReturns(amount, rate, period) {
    const monthlyRate = rate / 100 / 12;
    const totalReturn = amount * (1 + (rate / 100) * (period / 12));
    const monthlyReturn = (totalReturn - amount) / period;
    
    return {
        totalReturn: totalReturn,
        monthlyReturn: monthlyReturn,
        totalProfit: totalReturn - amount
    };
}
```

### Step 4: Investment Confirmation

Users confirm investments through a secure process:
1. **Amount Selection**: Choose investment amount within limits
2. **Terms Agreement**: Accept investment terms and conditions
3. **Payment Processing**: Complete payment through selected gateway
4. **Investment Confirmation**: Receive investment confirmation

## Property Features

### Property Attributes

#### Location Information
```php
// Address model relationship
class Property extends Model {
    public function address() {
        return $this->belongsTo(Address::class);
    }
}

// Address details
$address = [
    'street' => '123 Main Street',
    'city' => 'New York',
    'state' => 'NY',
    'zip_code' => '10001',
    'country' => 'USA',
    'latitude' => 40.7128,
    'longitude' => -74.0060
];
```

#### Property Specifications
- **Property Size**: Square footage or area
- **Bedrooms/Bathrooms**: For residential properties
- **Parking Spaces**: Available parking
- **Year Built**: Construction year
- **Property Condition**: New, renovated, etc.

#### Investment Terms
- **Minimum Investment**: Lowest investment amount allowed
- **Maximum Investment**: Highest investment amount per user
- **Fixed vs Flexible**: Fixed amount or range-based investment
- **Investment Period**: Duration of investment
- **Expected Returns**: Annual percentage return
- **Return Frequency**: Monthly, quarterly, or annual

### Property Categories

#### Residential Properties
- **Single Family Homes**: Individual houses
- **Apartments**: Multi-unit residential buildings
- **Condominiums**: Individual units in larger complexes
- **Townhouses**: Connected residential units

#### Commercial Properties
- **Office Buildings**: Commercial office spaces
- **Retail Spaces**: Shopping centers, stores
- **Warehouses**: Industrial storage facilities
- **Mixed-Use**: Combined residential and commercial

## Investment Types

### Fixed Amount Investment

Properties with predetermined investment amounts:
```php
$property = Property::create([
    'title' => 'Premium Office Building',
    'fixed_amount' => 5000.00,
    'minimum_amount' => null,
    'maximum_amount' => null,
]);
```

### Flexible Investment

Properties with minimum and maximum investment ranges:
```php
$property = Property::create([
    'title' => 'Residential Complex',
    'fixed_amount' => null,
    'minimum_amount' => 1000.00,
    'maximum_amount' => 25000.00,
]);
```

### Investment Limits

- **Per User Limits**: Maximum investment per user per property
- **Total Property Limits**: Maximum total investment for property
- **Platform Limits**: Overall investment limits per user

## Returns & Dividends

### Return Calculation

Returns are calculated based on property performance:
```php
class Investment extends Model {
    public function calculateReturns() {
        $property = $this->property;
        $investmentAmount = $this->amount;
        $returnRate = $property->expected_return_rate / 100;
        $monthsElapsed = $this->getMonthsElapsed();
        
        $expectedReturn = $investmentAmount * $returnRate * ($monthsElapsed / 12);
        return $expectedReturn;
    }
}
```

### Return Distribution

Returns are distributed automatically:
1. **Calculation**: Calculate returns based on property performance
2. **Distribution**: Distribute returns to all investors proportionally
3. **Notification**: Notify investors of return payments
4. **Transaction Recording**: Record all return transactions

### Return Types

#### Regular Returns
- **Monthly Returns**: Regular monthly dividend payments
- **Quarterly Returns**: Quarterly profit distributions
- **Annual Returns**: Yearly return payments

#### Capital Appreciation
- **Property Value Increase**: Benefit from property value appreciation
- **Sale Proceeds**: Share in proceeds when property is sold

## Property Sharing

### Share Investment

Users can share their property investments:
```php
class PropertyShare extends Model {
    protected $fillable = [
        'investment_id',
        'shared_user_id',
        'share_percentage',
        'share_amount',
        'status'
    ];
}
```

### Sharing Process

1. **Select Investment**: Choose investment to share
2. **Set Share Details**: Define share percentage or amount
3. **Select Recipient**: Choose user to share with
4. **Confirmation**: Both parties confirm the share
5. **Transfer**: Investment share is transferred

### Share Management

- **View Shared Investments**: Track all shared investments
- **Share History**: Complete sharing transaction history
- **Share Limits**: Limits on sharing amounts and frequency

## Property Offers

### Offer System

Users can make offers on property investments:
```php
class PropertyOffer extends Model {
    protected $fillable = [
        'property_id',
        'user_id',
        'offer_amount',
        'offer_type',
        'message',
        'status',
        'expires_at'
    ];
}
```

### Offer Types

#### Buy Offers
- **Full Purchase**: Offer to buy entire property investment
- **Partial Purchase**: Offer to buy portion of investment
- **Bulk Purchase**: Multiple property investment offers

#### Investment Offers
- **Direct Investment**: Offer to invest specific amount
- **Partnership**: Offer to partner on investment
- **Joint Investment**: Collaborative investment offers

### Offer Management

#### Creating Offers
1. **Select Property**: Choose property to make offer on
2. **Offer Details**: Set offer amount, type, and terms
3. **Message**: Include message with offer
4. **Expiration**: Set offer expiration date
5. **Submit**: Submit offer for review

#### Offer Responses
- **Accept**: Property owner accepts the offer
- **Counter**: Property owner makes counter-offer
- **Reject**: Property owner rejects the offer
- **Expire**: Offer expires automatically

## API Endpoints

### Property Endpoints

#### Get All Properties
```http
GET /api/properties
Authorization: Bearer {token}

Response:
{
    "status": "success",
    "data": {
        "properties": [...],
        "pagination": {...}
    }
}
```

#### Get Property Details
```http
GET /api/properties/{id}
Authorization: Bearer {token}

Response:
{
    "status": "success",
    "data": {
        "property": {
            "id": 1,
            "title": "Luxury Downtown Apartment",
            "total_value": 500000,
            "minimum_amount": 1000,
            "maximum_amount": 50000,
            "expected_return_rate": 8.5,
            "images": [...],
            "amenities": [...],
            "address": {...}
        }
    }
}
```

#### Make Investment
```http
POST /api/properties/{id}/invest
Authorization: Bearer {token}
Content-Type: application/json

{
    "amount": 5000,
    "payment_method": "stripe"
}

Response:
{
    "status": "success",
    "data": {
        "investment": {
            "id": 123,
            "amount": 5000,
            "status": "active"
        },
        "payment_url": "https://..."
    }
}
```

### Investment Endpoints

#### Get User Investments
```http
GET /api/investments
Authorization: Bearer {token}

Response:
{
    "status": "success",
    "data": {
        "investments": [
            {
                "id": 123,
                "property": {...},
                "amount": 5000,
                "returns_earned": 150.50,
                "status": "active"
            }
        ]
    }
}
```

#### Get Investment Details
```http
GET /api/investments/{id}
Authorization: Bearer {token}

Response:
{
    "status": "success",
    "data": {
        "investment": {
            "id": 123,
            "property": {...},
            "amount": 5000,
            "returns_earned": 150.50,
            "return_history": [...],
            "status": "active"
        }
    }
}
```

### Offer Endpoints

#### Create Property Offer
```http
POST /api/properties/{id}/offers
Authorization: Bearer {token}
Content-Type: application/json

{
    "offer_amount": 10000,
    "offer_type": "investment",
    "message": "Interested in this property",
    "expires_at": "2024-12-31"
}
```

#### Respond to Offer
```http
PUT /api/offers/{id}/respond
Authorization: Bearer {token}
Content-Type: application/json

{
    "response": "accept",
    "message": "Offer accepted"
}
```

## Database Schema

### Properties Table
```sql
CREATE TABLE properties (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    property_type VARCHAR(100),
    address_id BIGINT,
    total_value DECIMAL(20,2),
    minimum_amount DECIMAL(20,2),
    maximum_amount DECIMAL(20,2),
    fixed_amount DECIMAL(20,2),
    expected_return_rate DECIMAL(5,2),
    investment_period INT,
    start_date DATE,
    expire_date DATE,
    status ENUM('active', 'funded', 'completed', 'cancelled'),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);
```

### Investments Table
```sql
CREATE TABLE investments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    amount DECIMAL(20,2) NOT NULL,
    returns_earned DECIMAL(20,2) DEFAULT 0,
    status ENUM('active', 'completed', 'cancelled'),
    next_return_date DATE,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (property_id) REFERENCES properties(id)
);
```

### Property Offers Table
```sql
CREATE TABLE property_offers (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    property_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    offer_amount DECIMAL(20,2) NOT NULL,
    offer_type ENUM('investment', 'purchase', 'partnership'),
    message TEXT,
    status ENUM('pending', 'accepted', 'rejected', 'expired'),
    expires_at TIMESTAMP,
    responded_at TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    
    FOREIGN KEY (property_id) REFERENCES properties(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### Property Shares Table
```sql
CREATE TABLE property_shares (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    investment_id BIGINT NOT NULL,
    shared_user_id BIGINT NOT NULL,
    share_percentage DECIMAL(5,2),
    share_amount DECIMAL(20,2),
    status ENUM('active', 'transferred', 'cancelled'),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    
    FOREIGN KEY (investment_id) REFERENCES investments(id),
    FOREIGN KEY (shared_user_id) REFERENCES users(id)
);
```

---

## Best Practices

### Property Management
1. **Accurate Valuations**: Ensure property valuations are accurate and up-to-date
2. **Clear Terms**: Provide clear investment terms and conditions
3. **Regular Updates**: Keep investors updated on property performance
4. **Risk Disclosure**: Clearly communicate investment risks

### Investment Processing
1. **Secure Payments**: Use secure payment processing for all transactions
2. **Verification**: Verify user identity and investment capacity
3. **Documentation**: Maintain detailed investment documentation
4. **Compliance**: Ensure compliance with financial regulations

### Return Distribution
1. **Timely Payments**: Distribute returns on schedule
2. **Transparent Calculations**: Provide clear return calculations
3. **Performance Tracking**: Monitor and report property performance
4. **Tax Documentation**: Provide necessary tax documentation

This comprehensive property investment system provides a robust foundation for real estate investment platforms, with features for property management, investment processing, and return distribution.