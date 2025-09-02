# Payment System Documentation

This document provides comprehensive information about the payment system, including supported payment gateways, deposit/withdrawal processes, and financial management features.

## Table of Contents

1. [Payment System Overview](#payment-system-overview)
2. [Supported Payment Gateways](#supported-payment-gateways)
3. [Deposit System](#deposit-system)
4. [Withdrawal System](#withdrawal-system)
5. [Money Transfer System](#money-transfer-system)
6. [Transaction Management](#transaction-management)
7. [Fee Management](#fee-management)
8. [Currency Support](#currency-support)
9. [Payment Security](#payment-security)
10. [API Integration](#api-integration)
11. [Webhook Management](#webhook-management)
12. [Financial Reporting](#financial-reporting)

## Payment System Overview

The Real Estate Investment Platform features a comprehensive payment system supporting 35+ payment gateways worldwide, multi-currency transactions, and various payment methods including credit cards, digital wallets, bank transfers, and cryptocurrencies.

### Key Features
- **35+ Payment Gateways**: Support for major global and regional payment providers
- **Multi-Currency**: Support for multiple currencies with real-time exchange rates
- **Multiple Payment Methods**: Cards, wallets, bank transfers, cryptocurrencies
- **Automated Processing**: Automated deposit and withdrawal processing
- **Fee Management**: Flexible fee structure configuration
- **Security**: PCI DSS compliant payment processing
- **Real-time Processing**: Instant payment confirmation and processing

### Payment Flow Architecture
```php
// Payment processing flow
class PaymentProcessor {
    public function processPayment($paymentData) {
        // 1. Validate payment data
        $this->validatePaymentData($paymentData);
        
        // 2. Select appropriate gateway
        $gateway = $this->selectGateway($paymentData['method']);
        
        // 3. Process payment
        $result = $gateway->processPayment($paymentData);
        
        // 4. Handle response
        return $this->handlePaymentResponse($result);
    }
}
```

## Supported Payment Gateways

### Credit/Debit Card Gateways

#### Stripe
```php
// Stripe payment configuration
'stripe' => [
    'name' => 'Stripe',
    'currencies' => ['USD', 'EUR', 'GBP', 'AUD', 'CAD', 'JPY'],
    'methods' => ['card', 'bank_transfer', 'apple_pay', 'google_pay'],
    'fees' => [
        'percentage' => 2.9,
        'fixed' => 0.30,
        'currency' => 'USD'
    ],
    'limits' => [
        'min_amount' => 0.50,
        'max_amount' => 999999.99
    ],
    'processing_time' => 'instant',
    'countries' => ['US', 'CA', 'GB', 'AU', 'EU']
]
```

#### Razorpay (India)
```php
'razorpay' => [
    'name' => 'Razorpay',
    'currencies' => ['INR'],
    'methods' => ['card', 'netbanking', 'upi', 'wallet'],
    'fees' => [
        'percentage' => 2.0,
        'fixed' => 0
    ],
    'limits' => [
        'min_amount' => 1.00,
        'max_amount' => 1000000.00
    ],
    'processing_time' => 'instant',
    'countries' => ['IN']
]
```

#### Authorize.Net
```php
'authorizenet' => [
    'name' => 'Authorize.Net',
    'currencies' => ['USD'],
    'methods' => ['card'],
    'fees' => [
        'percentage' => 2.9,
        'fixed' => 0.30
    ],
    'processing_time' => 'instant',
    'countries' => ['US', 'CA', 'GB', 'AU']
]
```

### Digital Wallets

#### PayPal
```php
'paypal' => [
    'name' => 'PayPal',
    'currencies' => ['USD', 'EUR', 'GBP', 'AUD', 'CAD'],
    'methods' => ['paypal', 'card'],
    'fees' => [
        'percentage' => 3.4,
        'fixed' => 0.30
    ],
    'processing_time' => 'instant',
    'countries' => 'worldwide'
]
```

#### Skrill
```php
'skrill' => [
    'name' => 'Skrill',
    'currencies' => ['USD', 'EUR', 'GBP'],
    'methods' => ['wallet'],
    'fees' => [
        'percentage' => 3.99,
        'fixed' => 0
    ],
    'processing_time' => 'instant'
]
```

### Cryptocurrency Gateways

#### CoinGate
```php
'coingate' => [
    'name' => 'CoinGate',
    'currencies' => ['USD', 'EUR'],
    'methods' => ['bitcoin', 'ethereum', 'litecoin'],
    'fees' => [
        'percentage' => 1.0,
        'fixed' => 0
    ],
    'processing_time' => '10-60 minutes',
    'supported_coins' => ['BTC', 'ETH', 'LTC', 'BCH', 'XRP']
]
```

#### Coinbase Commerce
```php
'coinbase_commerce' => [
    'name' => 'Coinbase Commerce',
    'currencies' => ['USD'],
    'methods' => ['bitcoin', 'ethereum', 'bitcoin_cash', 'litecoin'],
    'fees' => [
        'percentage' => 1.0,
        'fixed' => 0
    ],
    'processing_time' => '10-60 minutes'
]
```

### Regional Gateways

#### Flutterwave (Africa)
```php
'flutterwave' => [
    'name' => 'Flutterwave',
    'currencies' => ['NGN', 'USD', 'EUR', 'GBP'],
    'methods' => ['card', 'bank_transfer', 'mobile_money'],
    'fees' => [
        'percentage' => 3.8,
        'fixed' => 0
    ],
    'countries' => ['NG', 'KE', 'UG', 'ZA', 'GH']
]
```

#### Khalti (Nepal)
```php
'khalti' => [
    'name' => 'Khalti',
    'currencies' => ['NPR'],
    'methods' => ['wallet', 'card'],
    'fees' => [
        'percentage' => 2.5,
        'fixed' => 0
    ],
    'countries' => ['NP']
]
```

## Deposit System

### Deposit Process Flow

#### User Deposit Journey
1. **Deposit Initiation**: User selects deposit amount and payment method
2. **Gateway Selection**: System selects appropriate payment gateway
3. **Payment Processing**: User completes payment with selected gateway
4. **Verification**: System verifies payment with gateway
5. **Balance Update**: User balance is updated upon successful payment
6. **Notification**: User receives deposit confirmation

#### Deposit Implementation
```php
class DepositController extends Controller {
    public function initiateDeposit(Request $request) {
        $request->validate([
            'amount' => 'required|numeric|min:1',
            'gateway' => 'required|string|exists:gateways,alias'
        ]);
        
        $gateway = Gateway::where('alias', $request->gateway)->first();
        
        // Check gateway limits
        if ($request->amount < $gateway->min_amount || 
            $request->amount > $gateway->max_amount) {
            return back()->withErrors(['amount' => 'Amount exceeds gateway limits']);
        }
        
        // Create deposit record
        $deposit = Deposit::create([
            'user_id' => auth()->id(),
            'gateway_id' => $gateway->id,
            'amount' => $request->amount,
            'charge' => $this->calculateCharge($request->amount, $gateway),
            'final_amount' => $request->amount + $this->calculateCharge($request->amount, $gateway),
            'transaction_id' => $this->generateTransactionId(),
            'status' => 'pending'
        ]);
        
        // Process payment with gateway
        $paymentService = $this->getPaymentService($gateway->alias);
        $paymentUrl = $paymentService->createPayment($deposit);
        
        return redirect($paymentUrl);
    }
    
    public function handleCallback(Request $request, $gateway) {
        $paymentService = $this->getPaymentService($gateway);
        $result = $paymentService->handleCallback($request);
        
        if ($result['status'] === 'success') {
            $deposit = Deposit::where('transaction_id', $result['transaction_id'])->first();
            
            $deposit->update([
                'status' => 'completed',
                'gateway_transaction_id' => $result['gateway_transaction_id']
            ]);
            
            // Update user balance
            $deposit->user->increment('balance', $deposit->amount);
            
            // Create transaction record
            Transaction::create([
                'user_id' => $deposit->user_id,
                'amount' => $deposit->amount,
                'type' => 'deposit',
                'description' => "Deposit via {$gateway}",
                'transaction_id' => $deposit->transaction_id
            ]);
            
            // Send notification
            $deposit->user->notify(new DepositSuccessful($deposit));
            
            return redirect()->route('user.deposit.success');
        }
        
        return redirect()->route('user.deposit.failed');
    }
}
```

### Deposit Features

#### Automatic Deposit Processing
- **Real-time Processing**: Instant deposit confirmation for supported gateways
- **Webhook Integration**: Automated processing via webhooks
- **Manual Review**: Admin review for large or suspicious deposits
- **Retry Mechanism**: Automatic retry for failed deposits

#### Deposit Limits
```php
// Dynamic deposit limits
public function getDepositLimits($userId, $gatewayId) {
    $user = User::find($userId);
    $gateway = Gateway::find($gatewayId);
    
    $baseLimits = [
        'min' => $gateway->min_amount,
        'max' => $gateway->max_amount
    ];
    
    // Adjust limits based on user KYC level
    if ($user->identity_verify && $user->address_verify) {
        $baseLimits['max'] *= 10; // Verified users get 10x limit
    } elseif ($user->identity_verify) {
        $baseLimits['max'] *= 5; // Partially verified users get 5x limit
    }
    
    // Daily/monthly limits
    $todayDeposits = $user->deposits()
                         ->where('status', 'completed')
                         ->whereDate('created_at', today())
                         ->sum('amount');
    
    $baseLimits['daily_remaining'] = max(0, $baseLimits['daily_max'] - $todayDeposits);
    
    return $baseLimits;
}
```

## Withdrawal System

### Withdrawal Process

#### Withdrawal Flow
1. **Withdrawal Request**: User submits withdrawal request
2. **Validation**: System validates withdrawal eligibility
3. **Admin Review**: Manual or automatic review based on amount
4. **Processing**: Payment processed through selected method
5. **Confirmation**: User receives withdrawal confirmation

#### Withdrawal Implementation
```php
class PayoutController extends Controller {
    public function requestWithdrawal(Request $request) {
        $request->validate([
            'amount' => 'required|numeric|min:1',
            'method' => 'required|string',
            'account_details' => 'required|array'
        ]);
        
        $user = auth()->user();
        
        // Check user balance
        if ($user->balance < $request->amount) {
            return back()->withErrors(['amount' => 'Insufficient balance']);
        }
        
        // Check withdrawal limits
        $limits = $this->getWithdrawalLimits($user->id);
        if ($request->amount > $limits['max'] || $request->amount < $limits['min']) {
            return back()->withErrors(['amount' => 'Amount exceeds withdrawal limits']);
        }
        
        // Calculate fees
        $fee = $this->calculateWithdrawalFee($request->amount, $request->method);
        $finalAmount = $request->amount - $fee;
        
        // Create payout record
        $payout = Payout::create([
            'user_id' => $user->id,
            'amount' => $request->amount,
            'charge' => $fee,
            'final_amount' => $finalAmount,
            'method' => $request->method,
            'account_details' => $request->account_details,
            'transaction_id' => $this->generateTransactionId(),
            'status' => 'pending'
        ]);
        
        // Deduct amount from user balance
        $user->decrement('balance', $request->amount);
        
        // Create transaction record
        Transaction::create([
            'user_id' => $user->id,
            'amount' => -$request->amount,
            'type' => 'withdrawal',
            'description' => "Withdrawal request via {$request->method}",
            'transaction_id' => $payout->transaction_id
        ]);
        
        // Auto-approve if amount is below threshold
        if ($request->amount <= config('payment.auto_approve_threshold', 1000)) {
            $this->processWithdrawal($payout->id);
        }
        
        return redirect()->route('user.withdrawal.success');
    }
    
    public function processWithdrawal($payoutId) {
        $payout = Payout::findOrFail($payoutId);
        
        try {
            $paymentService = $this->getPayoutService($payout->method);
            $result = $paymentService->processWithdrawal($payout);
            
            if ($result['status'] === 'success') {
                $payout->update([
                    'status' => 'completed',
                    'gateway_transaction_id' => $result['transaction_id'],
                    'processed_at' => now()
                ]);
                
                $payout->user->notify(new WithdrawalProcessed($payout));
            } else {
                $payout->update(['status' => 'failed']);
                
                // Refund user balance
                $payout->user->increment('balance', $payout->amount);
                
                $payout->user->notify(new WithdrawalFailed($payout));
            }
        } catch (Exception $e) {
            Log::error('Withdrawal processing failed: ' . $e->getMessage());
            $payout->update(['status' => 'failed']);
        }
    }
}
```

### Withdrawal Methods

#### Bank Transfer
```php
'bank_transfer' => [
    'name' => 'Bank Transfer',
    'required_fields' => [
        'account_holder_name',
        'account_number',
        'bank_name',
        'routing_number',
        'swift_code'
    ],
    'processing_time' => '1-3 business days',
    'fees' => [
        'percentage' => 0,
        'fixed' => 5.00
    ],
    'limits' => [
        'min' => 50.00,
        'max' => 50000.00
    ]
]
```

#### Digital Wallet
```php
'paypal_withdrawal' => [
    'name' => 'PayPal',
    'required_fields' => [
        'paypal_email'
    ],
    'processing_time' => 'instant',
    'fees' => [
        'percentage' => 2.0,
        'fixed' => 0
    ],
    'limits' => [
        'min' => 10.00,
        'max' => 10000.00
    ]
]
```

## Money Transfer System

### Internal Transfers

#### User-to-User Transfers
```php
class MoneyTransferController extends Controller {
    public function transfer(Request $request) {
        $request->validate([
            'recipient' => 'required|string|exists:users,username',
            'amount' => 'required|numeric|min:1',
            'note' => 'nullable|string|max:255'
        ]);
        
        $sender = auth()->user();
        $recipient = User::where('username', $request->recipient)->first();
        
        // Validate transfer
        if ($sender->id === $recipient->id) {
            return back()->withErrors(['recipient' => 'Cannot transfer to yourself']);
        }
        
        if ($sender->balance < $request->amount) {
            return back()->withErrors(['amount' => 'Insufficient balance']);
        }
        
        // Calculate transfer fee
        $fee = $this->calculateTransferFee($request->amount);
        $totalDeduction = $request->amount + $fee;
        
        if ($sender->balance < $totalDeduction) {
            return back()->withErrors(['amount' => 'Insufficient balance including fees']);
        }
        
        DB::transaction(function () use ($sender, $recipient, $request, $fee) {
            // Deduct from sender
            $sender->decrement('balance', $request->amount + $fee);
            
            // Add to recipient
            $recipient->increment('balance', $request->amount);
            
            // Create transfer record
            MoneyTransfer::create([
                'sender_id' => $sender->id,
                'recipient_id' => $recipient->id,
                'amount' => $request->amount,
                'fee' => $fee,
                'note' => $request->note,
                'transaction_id' => $this->generateTransactionId()
            ]);
            
            // Create transaction records
            Transaction::create([
                'user_id' => $sender->id,
                'amount' => -($request->amount + $fee),
                'type' => 'transfer_out',
                'description' => "Transfer to {$recipient->username}",
                'reference_id' => $recipient->id
            ]);
            
            Transaction::create([
                'user_id' => $recipient->id,
                'amount' => $request->amount,
                'type' => 'transfer_in',
                'description' => "Transfer from {$sender->username}",
                'reference_id' => $sender->id
            ]);
        });
        
        // Send notifications
        $sender->notify(new TransferSent($recipient, $request->amount));
        $recipient->notify(new TransferReceived($sender, $request->amount));
        
        return redirect()->back()->with('success', 'Transfer completed successfully');
    }
}
```

### Transfer Features
- **Instant Transfers**: Real-time internal transfers
- **Transfer Fees**: Configurable transfer fee structure
- **Transfer Limits**: Daily and monthly transfer limits
- **Transfer History**: Complete transfer transaction history
- **Bulk Transfers**: Admin bulk transfer capabilities

## Transaction Management

### Transaction Types

#### Transaction Categories
```php
// Transaction type definitions
$transactionTypes = [
    'deposit' => 'Deposit',
    'withdrawal' => 'Withdrawal',
    'investment' => 'Investment',
    'return' => 'Investment Return',
    'referral_bonus' => 'Referral Commission',
    'transfer_in' => 'Money Received',
    'transfer_out' => 'Money Sent',
    'fee' => 'Processing Fee',
    'refund' => 'Refund'
];
```

#### Transaction Model
```php
class Transaction extends Model {
    protected $fillable = [
        'user_id',
        'amount',
        'type',
        'description',
        'transaction_id',
        'reference_id',
        'status',
        'metadata'
    ];
    
    protected $casts = [
        'metadata' => 'array'
    ];
    
    public function user() {
        return $this->belongsTo(User::class);
    }
    
    public function getFormattedAmountAttribute() {
        $symbol = basicControl()->currency_symbol;
        return $symbol . number_format(abs($this->amount), 2);
    }
    
    public function getTypeColorAttribute() {
        $colors = [
            'deposit' => 'success',
            'withdrawal' => 'warning',
            'investment' => 'primary',
            'return' => 'success',
            'referral_bonus' => 'info',
            'transfer_in' => 'success',
            'transfer_out' => 'danger',
            'fee' => 'secondary',
            'refund' => 'info'
        ];
        
        return $colors[$this->type] ?? 'secondary';
    }
}
```

### Transaction Tracking

#### Transaction Status
- **Pending**: Transaction initiated but not completed
- **Processing**: Transaction being processed
- **Completed**: Transaction successfully completed
- **Failed**: Transaction failed
- **Cancelled**: Transaction cancelled
- **Refunded**: Transaction refunded

#### Transaction History
```php
// Advanced transaction filtering
public function getTransactionHistory(Request $request) {
    $query = Transaction::where('user_id', auth()->id());
    
    // Filter by type
    if ($request->type) {
        $query->where('type', $request->type);
    }
    
    // Filter by date range
    if ($request->date_from) {
        $query->whereDate('created_at', '>=', $request->date_from);
    }
    
    if ($request->date_to) {
        $query->whereDate('created_at', '<=', $request->date_to);
    }
    
    // Filter by amount range
    if ($request->amount_from) {
        $query->where('amount', '>=', $request->amount_from);
    }
    
    if ($request->amount_to) {
        $query->where('amount', '<=', $request->amount_to);
    }
    
    return $query->orderBy('created_at', 'desc')->paginate(20);
}
```

## Fee Management

### Fee Structure

#### Fee Types
```php
// Fee configuration
$feeStructure = [
    'deposit' => [
        'type' => 'percentage',
        'value' => 2.5,
        'min' => 0.50,
        'max' => 100.00
    ],
    'withdrawal' => [
        'type' => 'fixed',
        'value' => 5.00,
        'min' => 5.00,
        'max' => 50.00
    ],
    'transfer' => [
        'type' => 'percentage',
        'value' => 1.0,
        'min' => 0.10,
        'max' => 10.00
    ],
    'investment' => [
        'type' => 'percentage',
        'value' => 0.5,
        'min' => 1.00,
        'max' => 25.00
    ]
];
```

#### Fee Calculation
```php
class FeeCalculator {
    public static function calculateFee($amount, $feeConfig) {
        switch ($feeConfig['type']) {
            case 'percentage':
                $fee = ($amount * $feeConfig['value']) / 100;
                break;
            case 'fixed':
                $fee = $feeConfig['value'];
                break;
            case 'tiered':
                $fee = self::calculateTieredFee($amount, $feeConfig['tiers']);
                break;
            default:
                $fee = 0;
        }
        
        // Apply min/max limits
        $fee = max($fee, $feeConfig['min'] ?? 0);
        $fee = min($fee, $feeConfig['max'] ?? PHP_FLOAT_MAX);
        
        return round($fee, 2);
    }
    
    private static function calculateTieredFee($amount, $tiers) {
        foreach ($tiers as $tier) {
            if ($amount >= $tier['min'] && $amount <= $tier['max']) {
                return ($amount * $tier['rate']) / 100;
            }
        }
        
        return 0;
    }
}
```

### Dynamic Fee Management
- **Gateway-specific Fees**: Different fees for different payment gateways
- **User-level Fees**: VIP users may have reduced fees
- **Promotional Fees**: Temporary fee reductions or waivers
- **Volume-based Fees**: Fees based on transaction volume

## Currency Support

### Multi-Currency System

#### Supported Currencies
```php
$supportedCurrencies = [
    'USD' => ['symbol' => '$', 'name' => 'US Dollar'],
    'EUR' => ['symbol' => '€', 'name' => 'Euro'],
    'GBP' => ['symbol' => '£', 'name' => 'British Pound'],
    'JPY' => ['symbol' => '¥', 'name' => 'Japanese Yen'],
    'AUD' => ['symbol' => 'A$', 'name' => 'Australian Dollar'],
    'CAD' => ['symbol' => 'C$', 'name' => 'Canadian Dollar'],
    'CHF' => ['symbol' => 'Fr', 'name' => 'Swiss Franc'],
    'INR' => ['symbol' => '₹', 'name' => 'Indian Rupee'],
    'BRL' => ['symbol' => 'R$', 'name' => 'Brazilian Real'],
    'NGN' => ['symbol' => '₦', 'name' => 'Nigerian Naira']
];
```

#### Exchange Rate Management
```php
class ExchangeRateService {
    public function updateExchangeRates() {
        $rates = $this->fetchExchangeRates();
        
        foreach ($rates as $currency => $rate) {
            ExchangeRate::updateOrCreate(
                ['currency' => $currency],
                [
                    'rate' => $rate,
                    'updated_at' => now()
                ]
            );
        }
    }
    
    public function convertAmount($amount, $fromCurrency, $toCurrency) {
        if ($fromCurrency === $toCurrency) {
            return $amount;
        }
        
        $fromRate = ExchangeRate::where('currency', $fromCurrency)->first();
        $toRate = ExchangeRate::where('currency', $toCurrency)->first();
        
        if (!$fromRate || !$toRate) {
            throw new Exception('Exchange rate not available');
        }
        
        // Convert to base currency (USD) then to target currency
        $usdAmount = $amount / $fromRate->rate;
        $convertedAmount = $usdAmount * $toRate->rate;
        
        return round($convertedAmount, 2);
    }
}
```

## Payment Security

### Security Measures

#### PCI DSS Compliance
- **Data Encryption**: All sensitive data encrypted in transit and at rest
- **Tokenization**: Credit card data tokenized, never stored
- **Access Control**: Restricted access to payment data
- **Regular Audits**: Regular security audits and compliance checks

#### Fraud Detection
```php
class FraudDetectionService {
    public function analyzeTransaction($transaction) {
        $riskScore = 0;
        
        // Check for suspicious patterns
        $riskScore += $this->checkVelocityRisk($transaction);
        $riskScore += $this->checkAmountRisk($transaction);
        $riskScore += $this->checkLocationRisk($transaction);
        $riskScore += $this->checkDeviceRisk($transaction);
        
        // Determine risk level
        if ($riskScore >= 80) {
            return 'high';
        } elseif ($riskScore >= 50) {
            return 'medium';
        } else {
            return 'low';
        }
    }
    
    private function checkVelocityRisk($transaction) {
        $recentTransactions = Transaction::where('user_id', $transaction->user_id)
                                       ->where('created_at', '>', now()->subHour())
                                       ->count();
        
        return $recentTransactions > 5 ? 30 : 0;
    }
}
```

#### Security Features
- **Two-Factor Authentication**: Required for large transactions
- **IP Whitelisting**: Restrict transactions from specific IP addresses
- **Device Fingerprinting**: Track and verify user devices
- **Transaction Limits**: Configurable transaction limits
- **Suspicious Activity Monitoring**: Real-time fraud monitoring

## API Integration

### Payment API Endpoints

#### Deposit API
```http
POST /api/deposits
Authorization: Bearer {token}
Content-Type: application/json

{
    "amount": 100.00,
    "gateway": "stripe",
    "currency": "USD"
}

Response:
{
    "status": "success",
    "data": {
        "deposit_id": 123,
        "payment_url": "https://checkout.stripe.com/...",
        "transaction_id": "TXN123456789"
    }
}
```

#### Withdrawal API
```http
POST /api/withdrawals
Authorization: Bearer {token}
Content-Type: application/json

{
    "amount": 500.00,
    "method": "bank_transfer",
    "account_details": {
        "account_number": "1234567890",
        "routing_number": "123456789",
        "account_holder_name": "John Doe"
    }
}

Response:
{
    "status": "success",
    "data": {
        "withdrawal_id": 456,
        "status": "pending",
        "processing_time": "1-3 business days"
    }
}
```

#### Transaction History API
```http
GET /api/transactions?type=deposit&limit=20&page=1
Authorization: Bearer {token}

Response:
{
    "status": "success",
    "data": {
        "transactions": [...],
        "pagination": {
            "current_page": 1,
            "total_pages": 5,
            "total_records": 100
        }
    }
}
```

### Gateway Integration

#### Gateway Service Interface
```php
interface PaymentGatewayInterface {
    public function createPayment($amount, $currency, $metadata = []);
    public function verifyPayment($transactionId);
    public function refundPayment($transactionId, $amount);
    public function handleWebhook($payload);
}
```

#### Gateway Implementation Example
```php
class StripePaymentService implements PaymentGatewayInterface {
    protected $stripe;
    
    public function __construct() {
        $this->stripe = new \Stripe\StripeClient(config('services.stripe.secret'));
    }
    
    public function createPayment($amount, $currency, $metadata = []) {
        $session = $this->stripe->checkout->sessions->create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => $currency,
                    'product_data' => [
                        'name' => 'Deposit',
                    ],
                    'unit_amount' => $amount * 100, // Convert to cents
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => route('deposit.success'),
            'cancel_url' => route('deposit.cancel'),
            'metadata' => $metadata
        ]);
        
        return $session->url;
    }
    
    public function handleWebhook($payload) {
        $event = \Stripe\Webhook::constructEvent(
            $payload,
            request()->header('stripe-signature'),
            config('services.stripe.webhook_secret')
        );
        
        switch ($event['type']) {
            case 'checkout.session.completed':
                $this->handleSuccessfulPayment($event['data']['object']);
                break;
            case 'payment_intent.payment_failed':
                $this->handleFailedPayment($event['data']['object']);
                break;
        }
    }
}
```

## Webhook Management

### Webhook Processing

#### Webhook Handler
```php
class WebhookController extends Controller {
    public function handle($gateway, Request $request) {
        try {
            $handler = $this->getWebhookHandler($gateway);
            $result = $handler->process($request);
            
            // Log webhook
            WebhookLog::create([
                'gateway' => $gateway,
                'payload' => $request->all(),
                'status' => $result['status'],
                'processed_at' => now()
            ]);
            
            return response()->json(['status' => 'success']);
        } catch (Exception $e) {
            Log::error("Webhook processing failed: " . $e->getMessage());
            return response()->json(['status' => 'error'], 500);
        }
    }
}
```

#### Webhook Security
- **Signature Verification**: Verify webhook signatures
- **IP Whitelisting**: Only accept webhooks from trusted IPs
- **Replay Protection**: Prevent webhook replay attacks
- **Rate Limiting**: Limit webhook processing rate

## Financial Reporting

### Revenue Analytics

#### Revenue Tracking
```php
class FinancialReportService {
    public function getRevenueReport($period = 'monthly') {
        $query = Transaction::where('type', 'fee');
        
        switch ($period) {
            case 'daily':
                return $query->selectRaw('DATE(created_at) as date, SUM(amount) as revenue')
                           ->groupBy('date')
                           ->orderBy('date')
                           ->get();
            case 'monthly':
                return $query->selectRaw('YEAR(created_at) as year, MONTH(created_at) as month, SUM(amount) as revenue')
                           ->groupBy('year', 'month')
                           ->orderBy('year', 'month')
                           ->get();
        }
    }
    
    public function getPaymentMethodAnalytics() {
        return Deposit::where('status', 'completed')
                    ->join('gateways', 'deposits.gateway_id', '=', 'gateways.id')
                    ->selectRaw('gateways.name, COUNT(*) as transactions, SUM(deposits.amount) as volume')
                    ->groupBy('gateways.name')
                    ->orderBy('volume', 'desc')
                    ->get();
    }
}
```

### Financial Reports
- **Revenue Reports**: Daily, weekly, monthly revenue
- **Transaction Volume**: Payment method transaction volumes
- **Success Rates**: Payment success rates by gateway
- **Fee Analysis**: Fee collection and analysis
- **Chargeback Reports**: Chargeback tracking and analysis

---

## Best Practices

### Payment Processing
1. **Always Validate**: Validate all payment data before processing
2. **Use HTTPS**: Ensure all payment communications use HTTPS
3. **Implement Idempotency**: Prevent duplicate payments
4. **Handle Failures Gracefully**: Proper error handling and user feedback

### Security
1. **PCI Compliance**: Maintain PCI DSS compliance
2. **Regular Updates**: Keep payment gateway SDKs updated
3. **Monitor Transactions**: Implement real-time fraud monitoring
4. **Secure Storage**: Never store sensitive payment data

### User Experience
1. **Clear Pricing**: Display all fees clearly to users
2. **Multiple Options**: Offer multiple payment methods
3. **Fast Processing**: Optimize for quick payment processing
4. **Mobile Optimization**: Ensure mobile-friendly payment flows

This comprehensive payment system provides secure, scalable, and user-friendly payment processing with support for multiple gateways, currencies, and payment methods.