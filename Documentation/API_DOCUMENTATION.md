# API Documentation

This document provides comprehensive information about the RESTful API endpoints available in the Real Estate Investment Platform, designed for mobile app integration and third-party services.

## Table of Contents

1. [API Overview](#api-overview)
2. [Authentication](#authentication)
3. [User Management](#user-management)
4. [Property & Investment APIs](#property--investment-apis)
5. [Financial APIs](#financial-apis)
6. [Support & Communication](#support--communication)
7. [Notification APIs](#notification-apis)
8. [Error Handling](#error-handling)
9. [Rate Limiting](#rate-limiting)
10. [SDK & Integration](#sdk--integration)

## API Overview

### Base URL
```
Production: https://yourplatform.com/api
Development: http://localhost:8000/api
```

### API Version
Current API Version: **v1**

### Content Type
All API requests should use `application/json` content type:
```http
Content-Type: application/json
Accept: application/json
```

### Response Format
All API responses follow a consistent JSON format:
```json
{
    "status": "success|error",
    "message": "Human readable message",
    "data": {
        // Response data
    },
    "errors": {
        // Validation errors (if any)
    },
    "meta": {
        // Additional metadata (pagination, etc.)
    }
}
```

## Authentication

### Authentication Methods

#### 1. Registration
```http
POST /api/register
Content-Type: application/json

{
    "firstname": "John",
    "lastname": "Doe",
    "username": "johndoe",
    "email": "john@example.com",
    "password": "password123",
    "password_confirmation": "password123",
    "country_code": "US",
    "phone": "+1234567890",
    "referral_id": "referrer_username" // optional
}
```

**Response:**
```json
{
    "status": "success",
    "message": "Registration successful. Please verify your email.",
    "data": {
        "user": {
            "id": 123,
            "firstname": "John",
            "lastname": "Doe",
            "username": "johndoe",
            "email": "john@example.com",
            "email_verified_at": null,
            "status": 1
        }
    }
}
```

#### 2. Login
```http
POST /api/login
Content-Type: application/json

{
    "email": "john@example.com",
    "password": "password123"
}
```

**Response:**
```json
{
    "status": "success",
    "message": "Login successful",
    "data": {
        "user": {
            "id": 123,
            "firstname": "John",
            "lastname": "Doe",
            "username": "johndoe",
            "email": "john@example.com",
            "balance": 1500.50,
            "email_verified_at": "2024-01-15T10:30:00Z",
            "two_fa": 1,
            "identity_verify": 1,
            "address_verify": 1
        },
        "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
        "token_type": "Bearer",
        "expires_in": 3600
    }
}
```

#### 3. Logout
```http
POST /api/logout
Authorization: Bearer {token}
```

### Token Usage
Include the authentication token in all subsequent requests:
```http
Authorization: Bearer {your-token-here}
```

### Password Reset

#### 1. Request Reset Code
```http
POST /api/reset/password/email
Content-Type: application/json

{
    "email": "john@example.com"
}
```

#### 2. Verify Reset Code
```http
POST /api/reset/password/code
Content-Type: application/json

{
    "email": "john@example.com",
    "code": "123456"
}
```

#### 3. Reset Password
```http
POST /api/password/reset
Content-Type: application/json

{
    "email": "john@example.com",
    "code": "123456",
    "password": "newpassword123",
    "password_confirmation": "newpassword123"
}
```

## User Management

### User Profile

#### Get User Profile
```http
GET /api/user/profile
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "user": {
            "id": 123,
            "firstname": "John",
            "lastname": "Doe",
            "username": "johndoe",
            "email": "john@example.com",
            "phone": "+1234567890",
            "country": "United States",
            "balance": 1500.50,
            "total_investment": 5000.00,
            "total_returns": 250.75,
            "profile_completion": 85,
            "kyc_status": "verified",
            "rank": {
                "title": "Gold Investor",
                "level": 3
            }
        }
    }
}
```

#### Update User Profile
```http
POST /api/update/user/profile
Authorization: Bearer {token}
Content-Type: application/json

{
    "firstname": "John",
    "lastname": "Doe",
    "phone": "+1234567890",
    "country": "United States",
    "state": "California",
    "city": "Los Angeles",
    "zip_code": "90210",
    "address_one": "123 Main Street",
    "address_two": "Apt 4B"
}
```

#### Change Password
```http
POST /api/change/password
Authorization: Bearer {token}
Content-Type: application/json

{
    "current_password": "oldpassword123",
    "password": "newpassword123",
    "password_confirmation": "newpassword123"
}
```

### KYC Verification

#### Get KYC Status
```http
GET /api/kycs
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "identity_verification": {
            "status": "approved",
            "documents": [
                {
                    "type": "passport",
                    "status": "approved",
                    "submitted_at": "2024-01-15T10:30:00Z"
                }
            ]
        },
        "address_verification": {
            "status": "pending",
            "documents": []
        }
    }
}
```

#### Submit KYC Documents
```http
POST /api/kyc-submit
Authorization: Bearer {token}
Content-Type: multipart/form-data

{
    "verification_type": "identity", // identity or address
    "document_type": "passport",
    "document_front": [file],
    "document_back": [file], // optional
    "additional_info": {
        "document_number": "P123456789",
        "expiry_date": "2030-12-31"
    }
}
```

### Two-Factor Authentication

#### Get 2FA Status
```http
GET /api/two/step/security
Authorization: Bearer {token}
```

#### Enable 2FA
```http
POST /api/two/step/enable
Authorization: Bearer {token}
Content-Type: application/json

{
    "code": "123456" // Google Authenticator code
}
```

#### Disable 2FA
```http
POST /api/two/step/disable
Authorization: Bearer {token}
Content-Type: application/json

{
    "code": "123456" // Google Authenticator code
}
```

## Property & Investment APIs

### Property Listings

#### Get All Properties
```http
GET /api/property?page=1&limit=20&type=residential&min_amount=1000&max_amount=50000
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "properties": [
            {
                "id": 1,
                "title": "Luxury Downtown Apartment",
                "property_type": "residential",
                "location": {
                    "address": "123 Main St, New York, NY",
                    "city": "New York",
                    "state": "NY",
                    "country": "USA"
                },
                "investment_details": {
                    "total_value": 500000.00,
                    "minimum_amount": 1000.00,
                    "maximum_amount": 50000.00,
                    "expected_return_rate": 8.5,
                    "investment_period": 12
                },
                "funding_progress": {
                    "total_funded": 350000.00,
                    "funding_percentage": 70,
                    "investors_count": 45
                },
                "images": [
                    "https://example.com/property1_1.jpg",
                    "https://example.com/property1_2.jpg"
                ],
                "amenities": ["Swimming Pool", "Gym", "Parking"],
                "status": "active"
            }
        ],
        "pagination": {
            "current_page": 1,
            "total_pages": 5,
            "total_records": 100,
            "per_page": 20
        }
    }
}
```

#### Get Property Details
```http
GET /api/property-details/{id}
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "property": {
            "id": 1,
            "title": "Luxury Downtown Apartment",
            "description": "A beautiful luxury apartment in downtown...",
            "property_type": "residential",
            "location": {
                "address": "123 Main St, New York, NY",
                "city": "New York",
                "state": "NY",
                "country": "USA",
                "coordinates": {
                    "latitude": 40.7128,
                    "longitude": -74.0060
                }
            },
            "investment_details": {
                "total_value": 500000.00,
                "minimum_amount": 1000.00,
                "maximum_amount": 50000.00,
                "expected_return_rate": 8.5,
                "investment_period": 12,
                "start_date": "2024-01-01",
                "expire_date": "2024-12-31"
            },
            "funding_progress": {
                "total_funded": 350000.00,
                "funding_percentage": 70,
                "remaining_amount": 150000.00,
                "investors_count": 45
            },
            "images": [
                {
                    "url": "https://example.com/property1_1.jpg",
                    "alt": "Property exterior"
                }
            ],
            "amenities": ["Swimming Pool", "Gym", "Parking", "Security"],
            "documents": [
                {
                    "name": "Property Certificate",
                    "url": "https://example.com/cert.pdf"
                }
            ],
            "faq": [
                {
                    "question": "What is the minimum investment?",
                    "answer": "The minimum investment is $1,000."
                }
            ],
            "reviews": {
                "average_rating": 4.5,
                "total_reviews": 23,
                "reviews": [
                    {
                        "user": "investor123",
                        "rating": 5,
                        "comment": "Great investment opportunity!",
                        "date": "2024-01-15T10:30:00Z"
                    }
                ]
            }
        }
    }
}
```

### Investment Management

#### Make Investment
```http
POST /api/invest/property/{id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "amount": 5000.00,
    "payment_method": "balance" // balance, gateway
}
```

**Response:**
```json
{
    "status": "success",
    "message": "Investment successful",
    "data": {
        "investment": {
            "id": 456,
            "property_id": 1,
            "amount": 5000.00,
            "status": "active",
            "expected_returns": 425.00,
            "next_return_date": "2024-02-01",
            "created_at": "2024-01-15T10:30:00Z"
        },
        "transaction": {
            "id": 789,
            "transaction_id": "TXN123456789",
            "amount": -5000.00,
            "type": "investment"
        }
    }
}
```

#### Get Investment History
```http
GET /api/invest/history?page=1&limit=20&status=active
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "investments": [
            {
                "id": 456,
                "property": {
                    "id": 1,
                    "title": "Luxury Downtown Apartment",
                    "image": "https://example.com/property1_1.jpg"
                },
                "amount": 5000.00,
                "returns_earned": 150.50,
                "expected_total_return": 425.00,
                "roi_percentage": 8.5,
                "status": "active",
                "next_return_date": "2024-02-01",
                "investment_date": "2024-01-15T10:30:00Z"
            }
        ],
        "summary": {
            "total_invested": 15000.00,
            "total_returns": 450.75,
            "active_investments": 3,
            "completed_investments": 1
        },
        "pagination": {
            "current_page": 1,
            "total_pages": 2,
            "total_records": 25
        }
    }
}
```

#### Get Investment Details
```http
GET /api/invest/history/details/{id}
Authorization: Bearer {token}
```

### Property Sharing & Offers

#### Get Share Market
```http
GET /api/share/market?page=1&limit=20
Authorization: Bearer {token}
```

#### Make Property Offer
```http
POST /api/property/make/offer/{property_id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "offer_amount": 10000.00,
    "offer_type": "investment", // investment, purchase, partnership
    "message": "Interested in this property investment",
    "expires_at": "2024-12-31"
}
```

#### Get My Properties
```http
GET /api/my/properties
Authorization: Bearer {token}
```

#### Share Property Investment
```http
POST /api/property/share/store/{investment_id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "share_percentage": 25.0,
    "share_price": 1250.00,
    "description": "Sharing 25% of my investment"
}
```

## Financial APIs

### Dashboard & Summary

#### Get Dashboard Data
```http
GET /api/dashboard
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "user": {
            "balance": 1500.50,
            "total_investment": 15000.00,
            "total_returns": 450.75,
            "pending_returns": 125.25
        },
        "investments": {
            "active_count": 5,
            "completed_count": 2,
            "total_value": 15000.00
        },
        "recent_transactions": [
            {
                "id": 123,
                "type": "return",
                "amount": 45.50,
                "description": "Monthly return from Property #1",
                "date": "2024-01-15T10:30:00Z"
            }
        ],
        "notifications": [
            {
                "id": 1,
                "title": "Return Payment Received",
                "message": "You received $45.50 return from your investment",
                "type": "return",
                "read": false,
                "created_at": "2024-01-15T10:30:00Z"
            }
        ]
    }
}
```

### Deposits

#### Get Deposit Methods
```http
GET /api/add/fund
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "gateways": [
            {
                "id": 1,
                "name": "Stripe",
                "alias": "stripe",
                "currencies": ["USD", "EUR", "GBP"],
                "min_amount": 10.00,
                "max_amount": 50000.00,
                "percentage_charge": 2.9,
                "fixed_charge": 0.30,
                "image": "https://example.com/stripe-logo.png"
            }
        ],
        "user_limits": {
            "daily_limit": 10000.00,
            "monthly_limit": 50000.00,
            "daily_used": 1500.00,
            "monthly_used": 5000.00
        }
    }
}
```

#### Create Deposit Request
```http
POST /api/payment/request
Authorization: Bearer {token}
Content-Type: application/json

{
    "gateway": "stripe",
    "amount": 1000.00,
    "currency": "USD"
}
```

**Response:**
```json
{
    "status": "success",
    "message": "Payment request created",
    "data": {
        "deposit": {
            "id": 789,
            "amount": 1000.00,
            "charge": 29.30,
            "final_amount": 1029.30,
            "transaction_id": "DEP123456789",
            "status": "pending"
        },
        "payment_url": "https://checkout.stripe.com/pay/cs_test_123...",
        "redirect_url": "https://yourapp.com/payment/success"
    }
}
```

### Withdrawals

#### Get Payout Methods
```http
GET /api/payout
Authorization: Bearer {token}
```

#### Request Withdrawal
```http
POST /api/payout/submit/confirm
Authorization: Bearer {token}
Content-Type: application/json

{
    "amount": 500.00,
    "method": "bank_transfer",
    "account_details": {
        "account_holder_name": "John Doe",
        "account_number": "1234567890",
        "bank_name": "Chase Bank",
        "routing_number": "123456789"
    }
}
```

### Money Transfers

#### Transfer Money to User
```http
POST /api/money/transfer/store
Authorization: Bearer {token}
Content-Type: application/json

{
    "recipient": "johndoe", // username
    "amount": 100.00,
    "note": "Payment for services"
}
```

#### Get Transfer History
```http
GET /api/money/transfer/history?page=1&limit=20
Authorization: Bearer {token}
```

### Transaction History

#### Get All Transactions
```http
GET /api/transaction?page=1&limit=20&type=deposit&date_from=2024-01-01&date_to=2024-01-31
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "transactions": [
            {
                "id": 123,
                "type": "deposit",
                "amount": 1000.00,
                "charge": 29.30,
                "final_amount": 1029.30,
                "description": "Deposit via Stripe",
                "status": "completed",
                "transaction_id": "DEP123456789",
                "created_at": "2024-01-15T10:30:00Z"
            }
        ],
        "summary": {
            "total_deposits": 5000.00,
            "total_withdrawals": 1500.00,
            "total_investments": 3000.00,
            "total_returns": 150.50
        },
        "pagination": {
            "current_page": 1,
            "total_pages": 3,
            "total_records": 50
        }
    }
}
```

## Support & Communication

### Support Tickets

#### Create Support Ticket
```http
POST /api/support/ticket/store
Authorization: Bearer {token}
Content-Type: application/json

{
    "subject": "Investment Question",
    "priority": "medium", // low, medium, high
    "message": "I have a question about my recent investment...",
    "attachments": ["file1.jpg", "file2.pdf"] // optional
}
```

#### Get Support Tickets
```http
GET /api/support/ticket/list?status=open&page=1&limit=10
Authorization: Bearer {token}
```

#### View Support Ticket
```http
GET /api/support/ticket/view/{ticket_id}
Authorization: Bearer {token}
```

#### Reply to Support Ticket
```http
POST /api/support/ticket/reply/{ticket_id}
Authorization: Bearer {token}
Content-Type: application/json

{
    "message": "Thank you for your response...",
    "attachments": ["reply_file.jpg"] // optional
}
```

### Referral System

#### Get Referral Information
```http
GET /api/referral
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "referral_code": "JOHN123",
        "referral_link": "https://platform.com/register?ref=JOHN123",
        "statistics": {
            "total_referrals": 15,
            "active_referrals": 12,
            "total_earnings": 450.75
        },
        "recent_referrals": [
            {
                "username": "newuser123",
                "joined_date": "2024-01-15T10:30:00Z",
                "status": "active",
                "investment_amount": 2000.00,
                "commission_earned": 100.00
            }
        ]
    }
}
```

#### Get Referral Bonuses
```http
GET /api/referral/bonus?page=1&limit=20
Authorization: Bearer {token}
```

### Rankings

#### Get User Rankings
```http
GET /api/rankings?page=1&limit=50
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "rankings": [
            {
                "rank": 1,
                "user": {
                    "username": "topinvestor",
                    "avatar": "https://example.com/avatar1.jpg"
                },
                "total_investment": 50000.00,
                "total_returns": 2500.00,
                "investment_count": 25,
                "rank_title": "Diamond Investor"
            }
        ],
        "user_rank": {
            "current_rank": 15,
            "rank_title": "Gold Investor",
            "total_investment": 15000.00,
            "next_rank_requirement": 25000.00
        }
    }
}
```

## Notification APIs

### Push Notifications

#### Get Notification Permissions
```http
GET /api/notification/permission
Authorization: Bearer {token}
```

#### Update Notification Permissions
```http
POST /api/notification/permission/update
Authorization: Bearer {token}
Content-Type: application/json

{
    "push_notifications": true,
    "email_notifications": true,
    "sms_notifications": false,
    "marketing_notifications": true,
    "investment_updates": true,
    "return_notifications": true
}
```

#### Get Pusher Configuration
```http
GET /api/pusher/configuration
Authorization: Bearer {token}
```

**Response:**
```json
{
    "status": "success",
    "data": {
        "pusher": {
            "key": "your-pusher-key",
            "cluster": "us2",
            "encrypted": true
        },
        "channels": {
            "user_channel": "user.123",
            "investment_channel": "investments.123"
        }
    }
}
```

## Error Handling

### HTTP Status Codes

The API uses standard HTTP status codes:

- **200 OK** - Request successful
- **201 Created** - Resource created successfully
- **400 Bad Request** - Invalid request data
- **401 Unauthorized** - Authentication required
- **403 Forbidden** - Access denied
- **404 Not Found** - Resource not found
- **422 Unprocessable Entity** - Validation errors
- **429 Too Many Requests** - Rate limit exceeded
- **500 Internal Server Error** - Server error

### Error Response Format

```json
{
    "status": "error",
    "message": "Validation failed",
    "errors": {
        "email": ["The email field is required."],
        "password": ["The password must be at least 8 characters."]
    },
    "error_code": "VALIDATION_ERROR"
}
```

### Common Error Codes

- `VALIDATION_ERROR` - Request validation failed
- `AUTHENTICATION_ERROR` - Invalid authentication credentials
- `AUTHORIZATION_ERROR` - Insufficient permissions
- `RESOURCE_NOT_FOUND` - Requested resource not found
- `INSUFFICIENT_BALANCE` - User has insufficient balance
- `INVESTMENT_LIMIT_EXCEEDED` - Investment limits exceeded
- `KYC_REQUIRED` - KYC verification required
- `ACCOUNT_SUSPENDED` - User account suspended

## Rate Limiting

### Rate Limits

The API implements rate limiting to prevent abuse:

- **Authentication endpoints**: 5 requests per minute
- **General API endpoints**: 100 requests per minute
- **File upload endpoints**: 10 requests per minute

### Rate Limit Headers

Rate limit information is included in response headers:

```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1642694400
```

### Rate Limit Exceeded Response

```json
{
    "status": "error",
    "message": "Rate limit exceeded",
    "error_code": "RATE_LIMIT_EXCEEDED",
    "retry_after": 60
}
```

## SDK & Integration

### Mobile SDK

We provide official SDKs for mobile app development:

#### Android SDK
```gradle
implementation 'com.yourplatform:android-sdk:1.0.0'
```

#### iOS SDK
```swift
// CocoaPods
pod 'YourPlatformSDK', '~> 1.0.0'
```

### Webhook Integration

For real-time updates, you can configure webhooks:

```http
POST /api/admin/webhooks
Authorization: Bearer {admin-token}
Content-Type: application/json

{
    "url": "https://yourapp.com/webhooks/platform",
    "events": [
        "investment.created",
        "return.paid",
        "deposit.completed",
        "withdrawal.processed"
    ],
    "secret": "your-webhook-secret"
}
```

### Testing

#### Postman Collection
Download our Postman collection for easy API testing:
[Download Postman Collection](https://api.yourplatform.com/postman-collection.json)

#### Test Environment
- Base URL: `https://sandbox.yourplatform.com/api`
- Test credentials provided upon request

---

## Best Practices

### API Integration
1. **Always handle errors gracefully** - Check response status and handle errors appropriately
2. **Implement retry logic** - For network failures and rate limiting
3. **Cache responses when appropriate** - Reduce API calls for static data
4. **Use pagination** - For large data sets
5. **Validate data before sending** - Client-side validation improves user experience

### Security
1. **Store tokens securely** - Use secure storage mechanisms
2. **Implement token refresh** - Handle token expiration gracefully
3. **Use HTTPS only** - Never send API requests over HTTP
4. **Validate SSL certificates** - Prevent man-in-the-middle attacks

### Performance
1. **Minimize API calls** - Batch requests when possible
2. **Use appropriate timeout values** - Balance between user experience and reliability
3. **Implement proper loading states** - Show progress indicators during API calls
4. **Handle offline scenarios** - Graceful degradation when network is unavailable

This comprehensive API documentation provides developers with all the information needed to integrate with the Real Estate Investment Platform effectively.