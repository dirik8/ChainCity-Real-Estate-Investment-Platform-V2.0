# ChainCity API Documentation

## Overview
The ChainCity API provides programmatic access to the real estate investment platform. All API endpoints are RESTful and return JSON responses.

## Base URL
```
Production: https://yourdomain.com/api
Development: http://localhost:8000/api
```

## Authentication
The API uses Bearer token authentication via Laravel Sanctum. Include the token in the Authorization header:
```
Authorization: Bearer {your-api-token}
```

## Rate Limiting
- 60 requests per minute for authenticated users
- 30 requests per minute for unauthenticated users

## Response Format
All responses follow this structure:
```json
{
    "success": true,
    "message": "Success message",
    "data": {},
    "errors": null
}
```

---

## Authentication Endpoints

### Register User
```http
POST /register
```

**Request Body:**
```json
{
    "firstname": "John",
    "lastname": "Doe",
    "username": "johndoe",
    "email": "john@example.com",
    "password": "Password123!",
    "password_confirmation": "Password123!",
    "country_code": "1",
    "phone": "2345678901",
    "referral_code": "REF123" // optional
}
```

**Response:**
```json
{
    "success": true,
    "message": "Registration successful",
    "data": {
        "user": {
            "id": 1,
            "username": "johndoe",
            "email": "john@example.com"
        },
        "token": "1|laravel_sanctum_token..."
    }
}
```

### Login
```http
POST /login
```

**Request Body:**
```json
{
    "email": "john@example.com",
    "password": "Password123!"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Login successful",
    "data": {
        "user": {
            "id": 1,
            "username": "johndoe",
            "email": "john@example.com"
        },
        "token": "2|laravel_sanctum_token...",
        "two_fa_required": false
    }
}
```

### Logout
```http
POST /logout
```
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
    "success": true,
    "message": "Logged out successfully"
}
```

### Password Reset Request
```http
POST /reset/password/email
```

**Request Body:**
```json
{
    "email": "john@example.com"
}
```

### Password Reset Verify Code
```http
POST /reset/password/code
```

**Request Body:**
```json
{
    "email": "john@example.com",
    "code": "123456"
}
```

### Password Reset
```http
POST /password/reset
```

**Request Body:**
```json
{
    "email": "john@example.com",
    "code": "123456",
    "password": "NewPassword123!",
    "password_confirmation": "NewPassword123!"
}
```

---

## Property Endpoints

### List Properties
```http
GET /properties
```
**Headers:** `Authorization: Bearer {token}`

**Query Parameters:**
- `page` (integer): Page number for pagination
- `per_page` (integer): Items per page (default: 15)
- `search` (string): Search term
- `min_price` (decimal): Minimum investment amount
- `max_price` (decimal): Maximum investment amount
- `status` (string): active|upcoming|completed
- `amenities` (string): Comma-separated amenity IDs
- `sort_by` (string): latest|popular|high_return|low_price

**Response:**
```json
{
    "success": true,
    "data": {
        "properties": [
            {
                "id": 1,
                "title": "Luxury Apartment Complex",
                "slug": "luxury-apartment-complex",
                "description": "Premium residential property...",
                "thumbnail": "path/to/image.jpg",
                "fixed_amount": null,
                "minimum_amount": "1000.00",
                "maximum_amount": "50000.00",
                "total_investment": "500000.00",
                "current_investment": "125000.00",
                "roi_percentage": "12.5",
                "return_period": "12 months",
                "status": "active",
                "amenities": ["Pool", "Gym", "Parking"],
                "location": "New York, NY",
                "investment_progress": 25
            }
        ],
        "pagination": {
            "total": 100,
            "per_page": 15,
            "current_page": 1,
            "last_page": 7
        }
    }
}
```

### Get Property Details
```http
GET /property/{id}
```
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
    "success": true,
    "data": {
        "property": {
            "id": 1,
            "title": "Luxury Apartment Complex",
            "description": "Full description...",
            "images": [
                "path/to/image1.jpg",
                "path/to/image2.jpg"
            ],
            "fixed_amount": null,
            "minimum_amount": "1000.00",
            "maximum_amount": "50000.00",
            "total_investment": "500000.00",
            "current_investment": "125000.00",
            "roi_percentage": "12.5",
            "return_period": "12 months",
            "property_type": "Residential",
            "size": "10,000 sq ft",
            "bedrooms": 50,
            "bathrooms": 50,
            "amenities": [
                {
                    "id": 1,
                    "name": "Swimming Pool",
                    "icon": "fa-swimming-pool"
                }
            ],
            "address": {
                "street": "123 Main St",
                "city": "New York",
                "state": "NY",
                "country": "USA",
                "zip": "10001"
            },
            "faq": [
                {
                    "question": "What is the minimum investment?",
                    "answer": "$1,000"
                }
            ],
            "documents": [
                {
                    "name": "Property Deed",
                    "url": "path/to/document.pdf"
                }
            ],
            "investment_stats": {
                "total_investors": 45,
                "average_investment": "2777.78",
                "days_remaining": 30
            }
        }
    }
}
```

### Search Properties
```http
GET /property/search
```
**Headers:** `Authorization: Bearer {token}`

**Query Parameters:**
- `q` (string): Search query
- `filters` (object): Advanced filters

---

## Investment Endpoints

### Create Investment
```http
POST /invest
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "property_id": 1,
    "amount": 5000,
    "payment_method": "stripe"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Investment initiated",
    "data": {
        "investment_id": 123,
        "payment_url": "https://payment-gateway.com/pay/xxx",
        "transaction_id": "TRX123456"
    }
}
```

### Get User Investments
```http
GET /investments
```
**Headers:** `Authorization: Bearer {token}`

**Query Parameters:**
- `status` (string): active|completed|pending
- `property_id` (integer): Filter by property
- `from_date` (date): Start date (Y-m-d)
- `to_date` (date): End date (Y-m-d)

**Response:**
```json
{
    "success": true,
    "data": {
        "investments": [
            {
                "id": 123,
                "property": {
                    "id": 1,
                    "title": "Luxury Apartment Complex"
                },
                "amount": "5000.00",
                "returns_earned": "625.00",
                "status": "active",
                "invested_at": "2025-01-01T10:00:00Z",
                "next_return_date": "2025-02-01T10:00:00Z"
            }
        ],
        "summary": {
            "total_invested": "25000.00",
            "total_returns": "3125.00",
            "active_investments": 5
        }
    }
}
```

### Get Investment Details
```http
GET /investment/{id}
```
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
    "success": true,
    "data": {
        "investment": {
            "id": 123,
            "property": {
                "id": 1,
                "title": "Luxury Apartment Complex",
                "roi_percentage": "12.5"
            },
            "amount": "5000.00",
            "returns": [
                {
                    "amount": "52.08",
                    "date": "2025-01-01",
                    "status": "paid"
                }
            ],
            "total_returns_earned": "625.00",
            "expected_total_returns": "625.00",
            "status": "active",
            "invested_at": "2025-01-01T10:00:00Z",
            "maturity_date": "2026-01-01T10:00:00Z"
        }
    }
}
```

---

## User Profile Endpoints

### Get Profile
```http
GET /profile
```
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
    "success": true,
    "data": {
        "user": {
            "id": 1,
            "username": "johndoe",
            "email": "john@example.com",
            "firstname": "John",
            "lastname": "Doe",
            "phone": "1234567890",
            "country_code": "1",
            "balance": "10000.00",
            "investment_balance": "25000.00",
            "total_returns": "3125.00",
            "rank": {
                "id": 1,
                "name": "Bronze",
                "icon": "bronze-badge.png"
            },
            "kyc_status": "verified",
            "two_fa_enabled": false,
            "email_verified": true,
            "created_at": "2025-01-01T00:00:00Z"
        }
    }
}
```

### Update Profile
```http
PUT /profile
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "firstname": "John",
    "lastname": "Doe",
    "phone": "9876543210",
    "address": "123 Main St",
    "city": "New York",
    "state": "NY",
    "zip": "10001",
    "country": "USA"
}
```

### Upload Avatar
```http
POST /profile/avatar
```
**Headers:** `Authorization: Bearer {token}`  
**Content-Type:** `multipart/form-data`

**Request Body:**
- `avatar` (file): Image file (jpg, png, max 2MB)

### Change Password
```http
POST /profile/password
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "current_password": "OldPassword123!",
    "password": "NewPassword123!",
    "password_confirmation": "NewPassword123!"
}
```

---

## KYC Endpoints

### Upload KYC Documents
```http
POST /kyc/upload
```
**Headers:** `Authorization: Bearer {token}`  
**Content-Type:** `multipart/form-data`

**Request Body:**
- `document_type` (string): passport|driving_license|national_id
- `front_image` (file): Front side of document
- `back_image` (file): Back side of document (optional)
- `selfie` (file): Selfie with document (optional)

### Get KYC Status
```http
GET /kyc/status
```
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
    "success": true,
    "data": {
        "kyc_status": "pending",
        "submitted_at": "2025-01-15T10:00:00Z",
        "documents": [
            {
                "type": "passport",
                "status": "pending"
            }
        ],
        "rejection_reason": null
    }
}
```

---

## Transaction Endpoints

### Get Transactions
```http
GET /transactions
```
**Headers:** `Authorization: Bearer {token}`

**Query Parameters:**
- `type` (string): deposit|withdrawal|investment|return|transfer|referral_bonus
- `from_date` (date): Start date
- `to_date` (date): End date
- `page` (integer): Page number

**Response:**
```json
{
    "success": true,
    "data": {
        "transactions": [
            {
                "id": 1,
                "transaction_id": "TRX123456",
                "type": "deposit",
                "amount": "1000.00",
                "charge": "10.00",
                "final_amount": "990.00",
                "status": "completed",
                "description": "Deposit via Stripe",
                "created_at": "2025-01-15T10:00:00Z"
            }
        ],
        "balance": {
            "available": "10000.00",
            "invested": "25000.00",
            "total": "35000.00"
        }
    }
}
```

---

## Deposit Endpoints

### Create Deposit
```http
POST /deposit
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "amount": 1000,
    "gateway_id": 1
}
```

**Response:**
```json
{
    "success": true,
    "data": {
        "deposit_id": 456,
        "payment_url": "https://payment-gateway.com/pay/xxx",
        "transaction_id": "TRX789012"
    }
}
```

### Get Deposit History
```http
GET /deposits
```
**Headers:** `Authorization: Bearer {token}`

---

## Payout Endpoints

### Request Payout
```http
POST /payout
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "amount": 500,
    "method_id": 1,
    "account_details": {
        "account_number": "1234567890",
        "account_name": "John Doe",
        "bank_name": "Example Bank"
    }
}
```

### Get Payout Methods
```http
GET /payout/methods
```
**Headers:** `Authorization: Bearer {token}`

### Get Payout History
```http
GET /payouts
```
**Headers:** `Authorization: Bearer {token}`

---

## Money Transfer Endpoints

### Transfer Money
```http
POST /transfer
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "recipient": "username_or_email",
    "amount": 100,
    "pin": "1234",
    "note": "Payment for services"
}
```

### Get Transfer History
```http
GET /transfers
```
**Headers:** `Authorization: Bearer {token}`

---

## Referral Endpoints

### Get Referral Info
```http
GET /referrals
```
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
    "success": true,
    "data": {
        "referral_code": "REF123456",
        "referral_link": "https://domain.com/register?ref=REF123456",
        "total_referrals": 10,
        "active_referrals": 8,
        "total_commission": "500.00",
        "referrals": [
            {
                "id": 1,
                "username": "user123",
                "joined_at": "2025-01-01T10:00:00Z",
                "status": "active",
                "commission_earned": "50.00"
            }
        ]
    }
}
```

### Get Referral Tree
```http
GET /referral-tree
```
**Headers:** `Authorization: Bearer {token}`

---

## Support Ticket Endpoints

### Create Ticket
```http
POST /support/ticket
```
**Headers:** `Authorization: Bearer {token}`  
**Content-Type:** `multipart/form-data`

**Request Body:**
- `subject` (string): Ticket subject
- `priority` (string): low|medium|high
- `department` (string): technical|billing|general
- `message` (string): Detailed description
- `attachments[]` (files): Supporting files

### Get Tickets
```http
GET /support/tickets
```
**Headers:** `Authorization: Bearer {token}`

**Query Parameters:**
- `status` (string): open|answered|closed
- `priority` (string): low|medium|high

### Get Ticket Details
```http
GET /support/ticket/{id}
```
**Headers:** `Authorization: Bearer {token}`

### Reply to Ticket
```http
POST /support/ticket/{id}/reply
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "message": "Reply message text"
}
```

### Close Ticket
```http
POST /support/ticket/{id}/close
```
**Headers:** `Authorization: Bearer {token}`

---

## Notification Endpoints

### Get Notifications
```http
GET /notifications
```
**Headers:** `Authorization: Bearer {token}`

**Query Parameters:**
- `type` (string): all|unread|read
- `page` (integer): Page number

### Mark Notification as Read
```http
POST /notification/{id}/read
```
**Headers:** `Authorization: Bearer {token}`

### Update Push Token
```http
POST /notification/token
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "token": "firebase_push_token",
    "device_type": "android|ios|web"
}
```

---

## Two-Factor Authentication

### Enable 2FA
```http
POST /2fa/enable
```
**Headers:** `Authorization: Bearer {token}`

**Response:**
```json
{
    "success": true,
    "data": {
        "secret": "JBSWY3DPEHPK3PXP",
        "qr_code": "data:image/png;base64,..."
    }
}
```

### Verify 2FA
```http
POST /2fa/verify
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "code": "123456"
}
```

### Disable 2FA
```http
POST /2fa/disable
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "password": "YourPassword123!",
    "code": "123456"
}
```

---

## Property Offers & Shares

### Make Property Offer
```http
POST /property/{id}/offer
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "share_percentage": 10,
    "offer_amount": 5000,
    "message": "I would like to purchase 10% shares"
}
```

### Get Property Offers
```http
GET /property/{id}/offers
```
**Headers:** `Authorization: Bearer {token}`

### Accept/Reject Offer
```http
POST /offer/{id}/respond
```
**Headers:** `Authorization: Bearer {token}`

**Request Body:**
```json
{
    "action": "accept|reject|counter",
    "counter_amount": 5500,
    "message": "Counter offer message"
}
```

---

## Error Responses

### Standard Error Format
```json
{
    "success": false,
    "message": "Error message",
    "errors": {
        "field_name": [
            "Validation error message"
        ]
    }
}
```

### Common HTTP Status Codes
- `200 OK`: Success
- `201 Created`: Resource created
- `400 Bad Request`: Invalid request
- `401 Unauthorized`: Authentication required
- `403 Forbidden`: Access denied
- `404 Not Found`: Resource not found
- `422 Unprocessable Entity`: Validation errors
- `429 Too Many Requests`: Rate limit exceeded
- `500 Internal Server Error`: Server error

---

## Webhooks

### Payment Gateway Webhooks

#### Stripe Webhook
```http
POST /webhook/stripe
```

#### PayPal Webhook
```http
POST /webhook/paypal
```

#### Coingate Webhook
```http
POST /webhook/coingate
```

### Webhook Security
All webhooks are verified using:
- Signature verification
- IP whitelisting
- Timestamp validation

---

## Testing

### Test Credentials
For development/testing:
```
Email: test@example.com
Password: Test123!
API Token: test_token_here
```

### Test Payment Cards
- Success: 4242 4242 4242 4242
- Decline: 4000 0000 0000 0002
- 3D Secure: 4000 0000 0000 3220

---

## SDK Examples

### JavaScript/Axios
```javascript
const axios = require('axios');

const api = axios.create({
    baseURL: 'https://yourdomain.com/api',
    headers: {
        'Authorization': 'Bearer YOUR_TOKEN',
        'Content-Type': 'application/json'
    }
});

// Get properties
api.get('/properties')
    .then(response => console.log(response.data))
    .catch(error => console.error(error));
```

### PHP/Guzzle
```php
$client = new \GuzzleHttp\Client([
    'base_uri' => 'https://yourdomain.com/api/',
    'headers' => [
        'Authorization' => 'Bearer YOUR_TOKEN',
        'Accept' => 'application/json',
    ]
]);

$response = $client->get('properties');
$data = json_decode($response->getBody(), true);
```

### Python/Requests
```python
import requests

headers = {
    'Authorization': 'Bearer YOUR_TOKEN',
    'Content-Type': 'application/json'
}

response = requests.get(
    'https://yourdomain.com/api/properties',
    headers=headers
)
data = response.json()
```

---

**API Version**: 1.0  
**Last Updated**: January 2025