# Technical Architecture Documentation

This document provides a comprehensive overview of the technical architecture, design patterns, and system components of the Real Estate Investment Platform.

## Table of Contents

1. [Architecture Overview](#architecture-overview)
2. [System Components](#system-components)
3. [Database Design](#database-design)
4. [API Architecture](#api-architecture)
5. [Security Architecture](#security-architecture)
6. [Payment System Architecture](#payment-system-architecture)
7. [Notification System](#notification-system)
8. [File Storage Architecture](#file-storage-architecture)
9. [Caching Strategy](#caching-strategy)
10. [Queue System](#queue-system)
11. [Performance Optimization](#performance-optimization)
12. [Scalability Considerations](#scalability-considerations)

## Architecture Overview

### High-Level Architecture

The Real Estate Investment Platform follows a modern, layered architecture based on the MVC pattern with additional service and repository layers for better separation of concerns.

```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                        │
├─────────────────────────────────────────────────────────────┤
│  Web Interface  │  Mobile App  │  Admin Panel  │  API       │
└─────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────┐
│                    Application Layer                         │
├─────────────────────────────────────────────────────────────┤
│  Controllers  │  Middleware  │  Form Requests  │  Resources │
└─────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────┐
│                    Business Logic Layer                      │
├─────────────────────────────────────────────────────────────┤
│  Services  │  Repositories  │  Events  │  Listeners         │
└─────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────┐
│                    Data Access Layer                         │
├─────────────────────────────────────────────────────────────┤
│  Models  │  Eloquent ORM  │  Database Migrations           │
└─────────────────────────────────────────────────────────────┘
                                │
┌─────────────────────────────────────────────────────────────┐
│                    Infrastructure Layer                      │
├─────────────────────────────────────────────────────────────┤
│  Database  │  Cache  │  Queue  │  File Storage  │  External APIs │
└─────────────────────────────────────────────────────────────┘
```

### Technology Stack

#### Backend Technologies
- **Framework**: Laravel 11.x
- **Language**: PHP 8.1+
- **Database**: MySQL 8.0+ / PostgreSQL 13+
- **Cache**: Redis 6.0+
- **Queue**: Redis / Database
- **Session**: Redis / Database
- **Search**: Elasticsearch (optional)

#### Frontend Technologies
- **CSS Framework**: Bootstrap 5.x
- **JavaScript**: Vanilla JS / Alpine.js
- **Build Tool**: Vite
- **Package Manager**: npm

#### Infrastructure
- **Web Server**: Nginx / Apache
- **Process Manager**: Supervisor (for queues)
- **File Storage**: Local / AWS S3 / DigitalOcean Spaces
- **CDN**: CloudFlare / AWS CloudFront
- **Monitoring**: Laravel Telescope / New Relic

## System Components

### Core Modules

#### 1. User Management Module
```php
app/
├── Http/Controllers/Auth/
│   ├── LoginController.php
│   ├── RegisterController.php
│   └── ResetPasswordController.php
├── Http/Controllers/User/
│   ├── ProfileController.php
│   ├── KycVerificationController.php
│   └── TwoFaSecurityController.php
├── Models/
│   ├── User.php
│   ├── UserKyc.php
│   └── UserLogin.php
└── Services/
    ├── UserService.php
    └── KycService.php
```

**Responsibilities:**
- User registration and authentication
- Profile management
- KYC verification
- Two-factor authentication
- Social login integration

#### 2. Property Management Module
```php
app/
├── Http/Controllers/
│   └── PropertyController.php
├── Models/
│   ├── Property.php
│   ├── Address.php
│   ├── Amenity.php
│   └── Image.php
└── Services/
    ├── PropertyService.php
    └── PropertySearchService.php
```

**Responsibilities:**
- Property listing management
- Property search and filtering
- Image and document management
- Amenity management
- Property status tracking

#### 3. Investment Management Module
```php
app/
├── Http/Controllers/
│   └── InvestmentController.php
├── Models/
│   ├── Investment.php
│   ├── PropertyShare.php
│   └── PropertyOffer.php
├── Services/
│   ├── InvestmentService.php
│   ├── ReturnCalculationService.php
│   └── PortfolioService.php
└── Jobs/
    ├── ProcessInvestmentReturns.php
    └── SendReturnNotifications.php
```

**Responsibilities:**
- Investment processing
- Return calculation and distribution
- Portfolio management
- Investment sharing
- Offer management

#### 4. Payment Management Module
```php
app/
├── Http/Controllers/
│   ├── DepositController.php
│   └── PayoutController.php
├── Models/
│   ├── Deposit.php
│   ├── Payout.php
│   ├── Transaction.php
│   └── Gateway.php
├── Services/Gateway/
│   ├── StripeService.php
│   ├── PayPalService.php
│   └── RazorpayService.php
└── Services/
    ├── PaymentService.php
    └── TransactionService.php
```

**Responsibilities:**
- Payment gateway integration
- Deposit processing
- Withdrawal processing
- Transaction management
- Fee calculation

### Design Patterns Used

#### 1. Repository Pattern
```php
// Repository Interface
interface PropertyRepositoryInterface
{
    public function findById(int $id): ?Property;
    public function findByStatus(string $status): Collection;
    public function create(array $data): Property;
    public function update(int $id, array $data): bool;
}

// Repository Implementation
class PropertyRepository implements PropertyRepositoryInterface
{
    public function findById(int $id): ?Property
    {
        return Property::find($id);
    }
    
    public function findByStatus(string $status): Collection
    {
        return Property::where('status', $status)->get();
    }
    
    // ... other methods
}
```

#### 2. Service Layer Pattern
```php
class InvestmentService
{
    protected PropertyRepositoryInterface $propertyRepository;
    protected PaymentService $paymentService;
    protected NotificationService $notificationService;
    
    public function __construct(
        PropertyRepositoryInterface $propertyRepository,
        PaymentService $paymentService,
        NotificationService $notificationService
    ) {
        $this->propertyRepository = $propertyRepository;
        $this->paymentService = $paymentService;
        $this->notificationService = $notificationService;
    }
    
    public function processInvestment(User $user, Property $property, float $amount): Investment
    {
        // Business logic for investment processing
        DB::transaction(function () use ($user, $property, $amount) {
            // Validate investment
            $this->validateInvestment($user, $property, $amount);
            
            // Process payment
            $this->paymentService->processPayment($user, $amount);
            
            // Create investment record
            $investment = $this->createInvestment($user, $property, $amount);
            
            // Send notifications
            $this->notificationService->sendInvestmentConfirmation($user, $investment);
            
            return $investment;
        });
    }
}
```

#### 3. Observer Pattern (Laravel Events)
```php
// Event
class InvestmentCreated
{
    public Investment $investment;
    
    public function __construct(Investment $investment)
    {
        $this->investment = $investment;
    }
}

// Listener
class SendInvestmentNotification
{
    public function handle(InvestmentCreated $event): void
    {
        $investment = $event->investment;
        
        // Send email notification
        Mail::to($investment->user)->send(new InvestmentConfirmationMail($investment));
        
        // Send push notification
        $investment->user->notify(new InvestmentCreatedNotification($investment));
    }
}
```

#### 4. Factory Pattern (Payment Gateways)
```php
class PaymentGatewayFactory
{
    public static function create(string $gateway): PaymentGatewayInterface
    {
        return match($gateway) {
            'stripe' => new StripePaymentGateway(),
            'paypal' => new PayPalPaymentGateway(),
            'razorpay' => new RazorpayPaymentGateway(),
            default => throw new InvalidArgumentException("Unsupported gateway: {$gateway}")
        };
    }
}
```

## Database Design

### Entity Relationship Diagram

```
┌─────────────┐    ┌──────────────┐    ┌─────────────┐
│    Users    │    │  Properties  │    │ Investments │
├─────────────┤    ├──────────────┤    ├─────────────┤
│ id (PK)     │    │ id (PK)      │    │ id (PK)     │
│ username    │◄──┐│ title        │◄──┐│ user_id (FK)│
│ email       │   ││ address_id   │   ││ property_id │
│ balance     │   ││ total_value  │   ││ amount      │
│ ...         │   ││ ...          │   ││ status      │
└─────────────┘   │└──────────────┘   │└─────────────┘
                  │                   │
┌─────────────┐   │┌──────────────┐   │
│ Transactions│   ││  Addresses   │   │
├─────────────┤   │├──────────────┤   │
│ id (PK)     │   ││ id (PK)      │   │
│ user_id (FK)│───┘│ street       │───┘
│ amount      │    │ city         │
│ type        │    │ country      │
│ ...         │    │ ...          │
└─────────────┘    └──────────────┘
```

### Key Database Tables

#### Users Table
```sql
CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    balance DECIMAL(20,2) DEFAULT 0.00,
    phone VARCHAR(255),
    country_code VARCHAR(10),
    status TINYINT DEFAULT 1,
    identity_verify TINYINT DEFAULT 0,
    address_verify TINYINT DEFAULT 0,
    two_fa TINYINT DEFAULT 0,
    email_verified_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    deleted_at TIMESTAMP NULL,
    
    INDEX idx_email (email),
    INDEX idx_username (username),
    INDEX idx_status (status)
);
```

#### Properties Table
```sql
CREATE TABLE properties (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    property_type VARCHAR(100),
    address_id BIGINT UNSIGNED,
    total_value DECIMAL(20,2) NOT NULL,
    minimum_amount DECIMAL(20,2),
    maximum_amount DECIMAL(20,2),
    fixed_amount DECIMAL(20,2),
    expected_return_rate DECIMAL(5,2),
    investment_period INT,
    start_date DATE,
    expire_date DATE,
    status ENUM('draft', 'active', 'funded', 'completed', 'cancelled') DEFAULT 'draft',
    amenity_id JSON,
    faq JSON,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    deleted_at TIMESTAMP NULL,
    
    INDEX idx_status (status),
    INDEX idx_property_type (property_type),
    INDEX idx_investment_range (minimum_amount, maximum_amount),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);
```

#### Investments Table
```sql
CREATE TABLE investments (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    property_id BIGINT UNSIGNED NOT NULL,
    amount DECIMAL(20,2) NOT NULL,
    returns_earned DECIMAL(20,2) DEFAULT 0.00,
    status ENUM('active', 'completed', 'cancelled') DEFAULT 'active',
    next_return_date DATE,
    installment_amount DECIMAL(20,2),
    total_installments INT,
    paid_installments INT DEFAULT 0,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    
    INDEX idx_user_id (user_id),
    INDEX idx_property_id (property_id),
    INDEX idx_status (status),
    INDEX idx_next_return_date (next_return_date),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
);
```

### Database Optimization

#### Indexing Strategy
```sql
-- Composite indexes for common queries
CREATE INDEX idx_user_status_created ON investments(user_id, status, created_at);
CREATE INDEX idx_property_status_amount ON properties(status, minimum_amount, maximum_amount);
CREATE INDEX idx_transaction_user_type_date ON transactions(user_id, type, created_at);

-- Full-text search indexes
CREATE FULLTEXT INDEX idx_property_search ON properties(title, description);
```

#### Query Optimization
```php
// Use eager loading to prevent N+1 queries
$investments = Investment::with(['user', 'property.address', 'property.images'])
    ->where('status', 'active')
    ->get();

// Use database-level aggregations
$userStats = User::selectRaw('
    COUNT(investments.id) as total_investments,
    SUM(investments.amount) as total_invested,
    SUM(investments.returns_earned) as total_returns
')->leftJoin('investments', 'users.id', '=', 'investments.user_id')
->where('users.id', $userId)
->first();
```

## API Architecture

### RESTful API Design

#### Resource-Based URLs
```
GET    /api/properties           # List properties
POST   /api/properties           # Create property (admin)
GET    /api/properties/{id}      # Get property details
PUT    /api/properties/{id}      # Update property (admin)
DELETE /api/properties/{id}      # Delete property (admin)

POST   /api/properties/{id}/invest    # Invest in property
GET    /api/investments               # List user investments
GET    /api/investments/{id}          # Get investment details
```

#### Consistent Response Format
```php
class ApiResponse
{
    public static function success($data = null, $message = null, $meta = null)
    {
        return response()->json([
            'status' => 'success',
            'message' => $message,
            'data' => $data,
            'meta' => $meta
        ]);
    }
    
    public static function error($message, $errors = null, $code = 400)
    {
        return response()->json([
            'status' => 'error',
            'message' => $message,
            'errors' => $errors
        ], $code);
    }
}
```

#### API Versioning
```php
// Route versioning
Route::prefix('api/v1')->group(function () {
    Route::apiResource('properties', PropertyController::class);
});

Route::prefix('api/v2')->group(function () {
    Route::apiResource('properties', V2\PropertyController::class);
});
```

#### Rate Limiting
```php
// Custom rate limiter
public function boot()
{
    RateLimiter::for('api', function (Request $request) {
        return $request->user()
            ? Limit::perMinute(100)->by($request->user()->id)
            : Limit::perMinute(20)->by($request->ip());
    });
}
```

## Security Architecture

### Authentication & Authorization

#### Multi-Factor Authentication Flow
```php
class TwoFactorAuthService
{
    public function generateSecret(): string
    {
        return Google2FA::generateSecretKey();
    }
    
    public function verifyCode(string $secret, string $code): bool
    {
        return Google2FA::verifyKey($secret, $code);
    }
    
    public function generateQrCode(string $secret, string $email): string
    {
        return Google2FA::getQRCodeUrl(
            config('app.name'),
            $email,
            $secret
        );
    }
}
```

#### Role-Based Access Control
```php
class RolePermissionService
{
    public function userHasPermission(User $user, string $permission): bool
    {
        return $user->roles()
            ->whereHas('permissions', function ($query) use ($permission) {
                $query->where('name', $permission);
            })
            ->exists();
    }
    
    public function assignRole(User $user, string $roleName): void
    {
        $role = Role::where('name', $roleName)->firstOrFail();
        $user->roles()->attach($role);
    }
}
```

### Data Security

#### Encryption
```php
// Sensitive data encryption
class EncryptionService
{
    public function encryptSensitiveData(array $data): array
    {
        $encryptedData = [];
        
        foreach ($data as $key => $value) {
            if (in_array($key, ['ssn', 'passport_number', 'bank_account'])) {
                $encryptedData[$key] = encrypt($value);
            } else {
                $encryptedData[$key] = $value;
            }
        }
        
        return $encryptedData;
    }
}
```

#### Input Validation
```php
class InvestmentRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'property_id' => 'required|exists:properties,id',
            'amount' => [
                'required',
                'numeric',
                'min:1',
                Rule::exists('properties', 'id')->where(function ($query) {
                    $property = Property::find($this->property_id);
                    if ($property) {
                        $query->where('minimum_amount', '<=', $this->amount)
                              ->where('maximum_amount', '>=', $this->amount);
                    }
                })
            ]
        ];
    }
}
```

## Payment System Architecture

### Payment Gateway Abstraction

#### Gateway Interface
```php
interface PaymentGatewayInterface
{
    public function createPayment(PaymentRequest $request): PaymentResponse;
    public function verifyPayment(string $transactionId): PaymentStatus;
    public function refundPayment(string $transactionId, float $amount): RefundResponse;
    public function handleWebhook(array $payload): WebhookResponse;
}
```

#### Gateway Implementation
```php
class StripePaymentGateway implements PaymentGatewayInterface
{
    protected StripeClient $stripe;
    
    public function createPayment(PaymentRequest $request): PaymentResponse
    {
        $session = $this->stripe->checkout->sessions->create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => $request->currency,
                    'product_data' => ['name' => 'Investment Deposit'],
                    'unit_amount' => $request->amount * 100,
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => $request->successUrl,
            'cancel_url' => $request->cancelUrl,
            'metadata' => $request->metadata
        ]);
        
        return new PaymentResponse($session->url, $session->id);
    }
}
```

### Transaction Processing

#### Idempotency Handling
```php
class TransactionService
{
    public function processTransaction(array $data): Transaction
    {
        $idempotencyKey = $data['idempotency_key'] ?? null;
        
        if ($idempotencyKey) {
            $existing = Transaction::where('idempotency_key', $idempotencyKey)->first();
            if ($existing) {
                return $existing;
            }
        }
        
        return DB::transaction(function () use ($data, $idempotencyKey) {
            $transaction = Transaction::create([
                'user_id' => $data['user_id'],
                'amount' => $data['amount'],
                'type' => $data['type'],
                'idempotency_key' => $idempotencyKey,
                'status' => 'pending'
            ]);
            
            // Process transaction logic...
            
            return $transaction;
        });
    }
}
```

## Notification System

### Multi-Channel Notifications

#### Notification Architecture
```php
abstract class BaseNotification extends Notification
{
    protected array $channels = ['mail', 'database'];
    
    public function via($notifiable): array
    {
        $channels = $this->channels;
        
        // Add push notification if user has enabled it
        if ($notifiable->push_notifications_enabled) {
            $channels[] = 'push';
        }
        
        // Add SMS if user has verified phone
        if ($notifiable->phone_verified && $this->shouldSendSms()) {
            $channels[] = 'sms';
        }
        
        return $channels;
    }
    
    abstract protected function shouldSendSms(): bool;
}
```

#### Real-time Notifications
```php
class InvestmentReturnNotification extends BaseNotification
{
    protected Investment $investment;
    
    public function __construct(Investment $investment)
    {
        $this->investment = $investment;
    }
    
    public function toMail($notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject('Investment Return Received')
            ->line("You've received a return of {$this->investment->formatted_return}")
            ->action('View Investment', url("/investments/{$this->investment->id}"));
    }
    
    public function toPush($notifiable): array
    {
        return [
            'title' => 'Return Received',
            'body' => "You've received {$this->investment->formatted_return} from your investment",
            'data' => [
                'type' => 'investment_return',
                'investment_id' => $this->investment->id
            ]
        ];
    }
}
```

### Push Notification Integration

#### Firebase Integration
```php
class FirebaseNotificationService
{
    protected FirebaseMessaging $messaging;
    
    public function sendToUser(User $user, array $notification): bool
    {
        $tokens = $user->firebaseTokens()->pluck('token')->toArray();
        
        if (empty($tokens)) {
            return false;
        }
        
        $message = CloudMessage::new()
            ->withNotification(Notification::create(
                $notification['title'],
                $notification['body']
            ))
            ->withData($notification['data'] ?? []);
        
        foreach ($tokens as $token) {
            try {
                $this->messaging->send($message->withChangedTarget('token', $token));
            } catch (Exception $e) {
                // Log error and possibly remove invalid token
                Log::error("Failed to send push notification: {$e->getMessage()}");
            }
        }
        
        return true;
    }
}
```

## File Storage Architecture

### Storage Abstraction

#### Multi-Storage Support
```php
class FileStorageService
{
    public function store(UploadedFile $file, string $path = null): string
    {
        $disk = config('filesystems.default');
        
        // Generate unique filename
        $filename = $this->generateUniqueFilename($file);
        $fullPath = ($path ? $path . '/' : '') . $filename;
        
        // Store file
        Storage::disk($disk)->put($fullPath, file_get_contents($file));
        
        // Create database record
        FileStorage::create([
            'filename' => $filename,
            'original_name' => $file->getClientOriginalName(),
            'path' => $fullPath,
            'disk' => $disk,
            'size' => $file->getSize(),
            'mime_type' => $file->getMimeType()
        ]);
        
        return $fullPath;
    }
    
    public function getUrl(string $path): string
    {
        $disk = config('filesystems.default');
        
        return match($disk) {
            's3' => Storage::disk('s3')->url($path),
            'spaces' => Storage::disk('spaces')->url($path),
            default => asset('storage/' . $path)
        };
    }
}
```

#### Image Processing
```php
class ImageProcessingService
{
    public function processPropertyImage(UploadedFile $image): array
    {
        $sizes = [
            'thumbnail' => [300, 200],
            'medium' => [800, 600],
            'large' => [1200, 900]
        ];
        
        $processedImages = [];
        
        foreach ($sizes as $size => [$width, $height]) {
            $processed = Image::make($image)
                ->resize($width, $height, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })
                ->encode('jpg', 85);
            
            $filename = $this->generateFilename($image, $size);
            Storage::put("properties/{$filename}", $processed);
            
            $processedImages[$size] = $filename;
        }
        
        return $processedImages;
    }
}
```

## Caching Strategy

### Multi-Level Caching

#### Application-Level Caching
```php
class PropertyCacheService
{
    protected int $ttl = 3600; // 1 hour
    
    public function getProperty(int $id): ?Property
    {
        return Cache::remember(
            "property.{$id}",
            $this->ttl,
            fn() => Property::with(['address', 'images', 'amenities'])->find($id)
        );
    }
    
    public function getActiveProperties(array $filters = []): Collection
    {
        $cacheKey = 'properties.active.' . md5(serialize($filters));
        
        return Cache::remember($cacheKey, $this->ttl, function () use ($filters) {
            $query = Property::where('status', 'active');
            
            // Apply filters
            if (isset($filters['type'])) {
                $query->where('property_type', $filters['type']);
            }
            
            if (isset($filters['min_amount'])) {
                $query->where('minimum_amount', '>=', $filters['min_amount']);
            }
            
            return $query->with(['address', 'images'])->get();
        });
    }
    
    public function clearPropertyCache(int $id): void
    {
        Cache::forget("property.{$id}");
        Cache::tags(['properties'])->flush();
    }
}
```

#### Database Query Caching
```php
class CachedRepository
{
    protected int $cacheTtl = 3600;
    
    public function findWithCache(int $id, array $relations = []): ?Model
    {
        $cacheKey = $this->getCacheKey($id, $relations);
        
        return Cache::remember($cacheKey, $this->cacheTtl, function () use ($id, $relations) {
            return $this->model->with($relations)->find($id);
        });
    }
    
    protected function getCacheKey(int $id, array $relations = []): string
    {
        $modelName = class_basename($this->model);
        $relationsKey = empty($relations) ? '' : '.' . implode('.', $relations);
        
        return strtolower("{$modelName}.{$id}{$relationsKey}");
    }
}
```

## Queue System

### Job Processing Architecture

#### Investment Processing Job
```php
class ProcessInvestmentJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    
    protected Investment $investment;
    
    public function __construct(Investment $investment)
    {
        $this->investment = $investment;
    }
    
    public function handle(): void
    {
        DB::transaction(function () {
            // Update property funding status
            $this->updatePropertyFunding();
            
            // Calculate and schedule returns
            $this->scheduleReturns();
            
            // Send notifications
            $this->sendNotifications();
            
            // Update user statistics
            $this->updateUserStats();
        });
    }
    
    public function failed(Throwable $exception): void
    {
        Log::error('Investment processing failed', [
            'investment_id' => $this->investment->id,
            'error' => $exception->getMessage()
        ]);
        
        // Notify administrators
        Notification::route('mail', config('mail.admin'))
            ->notify(new InvestmentProcessingFailed($this->investment, $exception));
    }
}
```

#### Queue Monitoring
```php
class QueueMonitorService
{
    public function getQueueStats(): array
    {
        return [
            'pending_jobs' => Queue::size(),
            'failed_jobs' => Queue::connection()->table('failed_jobs')->count(),
            'processed_today' => $this->getProcessedJobsCount(today()),
            'average_processing_time' => $this->getAverageProcessingTime()
        ];
    }
    
    public function retryFailedJobs(): void
    {
        Artisan::call('queue:retry', ['id' => 'all']);
    }
}
```

## Performance Optimization

### Database Optimization

#### Query Optimization
```php
// Use database-level calculations instead of PHP loops
$userInvestmentStats = DB::table('investments')
    ->select([
        'user_id',
        DB::raw('COUNT(*) as total_investments'),
        DB::raw('SUM(amount) as total_invested'),
        DB::raw('SUM(returns_earned) as total_returns'),
        DB::raw('AVG(amount) as average_investment')
    ])
    ->where('status', 'active')
    ->groupBy('user_id')
    ->get();
```

#### Connection Optimization
```php
// Use read/write connections
'mysql' => [
    'read' => [
        'host' => ['192.168.1.1', '192.168.1.2'],
    ],
    'write' => [
        'host' => ['192.168.1.3'],
    ],
    // ... other configuration
]
```

### Application Optimization

#### Lazy Loading and Eager Loading
```php
// Avoid N+1 queries
$properties = Property::with([
    'address',
    'images' => function ($query) {
        $query->where('type', 'main');
    },
    'investments' => function ($query) {
        $query->where('status', 'active');
    }
])->get();
```

#### Response Caching
```php
class PropertyController extends Controller
{
    public function index(Request $request)
    {
        $cacheKey = 'properties.index.' . md5($request->fullUrl());
        
        return Cache::remember($cacheKey, 300, function () use ($request) {
            $properties = Property::filter($request->all())
                ->with(['address', 'images'])
                ->paginate(20);
            
            return PropertyResource::collection($properties);
        });
    }
}
```

## Scalability Considerations

### Horizontal Scaling

#### Load Balancing
```nginx
upstream app_servers {
    server app1.example.com:80;
    server app2.example.com:80;
    server app3.example.com:80;
}

server {
    listen 80;
    location / {
        proxy_pass http://app_servers;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

#### Database Scaling
```php
// Database sharding configuration
'mysql' => [
    'shard1' => [
        'host' => 'shard1.example.com',
        'database' => 'platform_shard1',
        // Users with ID 1-1000000
    ],
    'shard2' => [
        'host' => 'shard2.example.com',
        'database' => 'platform_shard2',
        // Users with ID 1000001-2000000
    ]
]
```

### Microservices Architecture

#### Service Separation
```
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│  User Service   │  │Property Service │  │Payment Service  │
├─────────────────┤  ├─────────────────┤  ├─────────────────┤
│ - Authentication│  │ - Property CRUD │  │ - Payment Proc. │
│ - User Profile  │  │ - Search/Filter │  │ - Gateway Mgmt  │
│ - KYC Process   │  │ - Image Mgmt    │  │ - Transaction   │
└─────────────────┘  └─────────────────┘  └─────────────────┘
         │                     │                     │
         └─────────────────────┼─────────────────────┘
                               │
                    ┌─────────────────┐
                    │  API Gateway    │
                    ├─────────────────┤
                    │ - Routing       │
                    │ - Auth          │
                    │ - Rate Limiting │
                    │ - Load Balancing│
                    └─────────────────┘
```

#### Event-Driven Architecture
```php
// Event publishing
class InvestmentService
{
    public function createInvestment(array $data): Investment
    {
        $investment = Investment::create($data);
        
        // Publish events to message queue
        Event::dispatch(new InvestmentCreated($investment));
        
        return $investment;
    }
}

// Event consumption
class UpdatePropertyFundingListener
{
    public function handle(InvestmentCreated $event): void
    {
        $property = $event->investment->property;
        $totalFunded = $property->investments()->sum('amount');
        
        if ($totalFunded >= $property->total_value) {
            $property->update(['status' => 'funded']);
            Event::dispatch(new PropertyFullyFunded($property));
        }
    }
}
```

---

This technical architecture provides a solid foundation for building a scalable, maintainable, and secure real estate investment platform. The modular design allows for easy extension and modification as business requirements evolve.