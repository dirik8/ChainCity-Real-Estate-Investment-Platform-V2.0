# Administrator Guide

This comprehensive guide covers all administrative features and backend management capabilities of the Real Estate Investment Platform.

## Table of Contents

1. [Admin Dashboard](#admin-dashboard)
2. [User Management](#user-management)
3. [Property Management](#property-management)
4. [Investment Management](#investment-management)
5. [Financial Management](#financial-management)
6. [Payment Gateway Management](#payment-gateway-management)
7. [KYC Management](#kyc-management)
8. [Content Management](#content-management)
9. [System Configuration](#system-configuration)
10. [Reports & Analytics](#reports--analytics)
11. [Support System](#support-system)
12. [Security Management](#security-management)

## Admin Dashboard

### Dashboard Overview

The admin dashboard provides a comprehensive overview of platform activities, key metrics, and system status.

#### Key Metrics Display
```php
// Dashboard metrics calculation
public function getDashboardMetrics() {
    return [
        'total_users' => User::count(),
        'active_users' => User::where('status', 1)->count(),
        'total_properties' => Property::count(),
        'active_properties' => Property::where('status', 'active')->count(),
        'total_investments' => Investment::sum('amount'),
        'pending_kyc' => UserKyc::where('status', 'pending')->count(),
        'pending_withdrawals' => Payout::where('status', 'pending')->count(),
        'monthly_revenue' => $this->calculateMonthlyRevenue(),
        'growth_rate' => $this->calculateGrowthRate()
    ];
}
```

#### Dashboard Widgets
- **User Statistics**: Total users, new registrations, active users
- **Investment Overview**: Total investments, active investments, returns distributed
- **Financial Summary**: Platform revenue, pending transactions, profit margins
- **Property Portfolio**: Total properties, funded properties, average funding time
- **System Health**: Server status, database performance, error rates
- **Recent Activities**: Latest user activities, transactions, system events

### Real-time Analytics

#### Live Data Updates
- **Active Users**: Currently online users
- **Real-time Transactions**: Live transaction feed
- **Investment Activity**: Real-time investment tracking
- **System Alerts**: Immediate system notifications

#### Performance Monitoring
- **Response Times**: API and page response times
- **Database Performance**: Query performance metrics
- **Error Tracking**: Real-time error monitoring
- **Resource Usage**: Server resource utilization

## User Management

### User Overview

#### User Listing
```php
// User management with filtering
public function getUsers(Request $request) {
    $query = User::with(['investments', 'kyc', 'referrer']);
    
    // Apply filters
    if ($request->status) {
        $query->where('status', $request->status);
    }
    
    if ($request->kyc_status) {
        $query->whereHas('kyc', function($q) use ($request) {
            $q->where('status', $request->kyc_status);
        });
    }
    
    if ($request->search) {
        $query->where(function($q) use ($request) {
            $q->where('email', 'like', "%{$request->search}%")
              ->orWhere('username', 'like', "%{$request->search}%")
              ->orWhere('firstname', 'like', "%{$request->search}%");
        });
    }
    
    return $query->paginate(50);
}
```

#### User Profile Management
- **Basic Information**: View and edit user details
- **Account Status**: Enable/disable user accounts
- **Balance Management**: View and adjust user balances
- **Investment History**: Complete investment portfolio
- **Transaction History**: All financial transactions
- **Login History**: User login tracking and device information

### User Actions

#### Account Management
```php
// User account actions
public function updateUserStatus($userId, $status) {
    $user = User::findOrFail($userId);
    
    $user->update(['status' => $status]);
    
    // Log admin action
    AdminLog::create([
        'admin_id' => auth()->id(),
        'action' => 'user_status_update',
        'target_id' => $userId,
        'details' => "Updated user status to: {$status}"
    ]);
    
    // Notify user
    $user->notify(new AccountStatusChanged($status));
}
```

#### Balance Operations
- **Add Balance**: Credit user account
- **Subtract Balance**: Debit user account
- **Balance History**: Track all balance changes
- **Bulk Operations**: Mass balance updates

#### Communication
- **Send Email**: Direct email to users
- **Send SMS**: Direct SMS notifications
- **Push Notifications**: Send push notifications
- **Bulk Messaging**: Mass communication tools

## Property Management

### Property Administration

#### Property Creation
```php
// Property creation with validation
public function createProperty(Request $request) {
    $request->validate([
        'title' => 'required|string|max:255',
        'property_type' => 'required|string',
        'total_value' => 'required|numeric|min:0',
        'minimum_amount' => 'required|numeric|min:0',
        'maximum_amount' => 'required|numeric|min:0',
        'expected_return_rate' => 'required|numeric|min:0|max:100',
        'investment_period' => 'required|integer|min:1',
        'images.*' => 'image|max:5120',
        'amenities' => 'array',
        'address' => 'required|array'
    ]);
    
    $property = Property::create($request->except(['images', 'amenities', 'address']));
    
    // Handle address
    $address = Address::create($request->address);
    $property->update(['address_id' => $address->id]);
    
    // Handle amenities
    if ($request->amenities) {
        $property->update(['amenity_id' => $request->amenities]);
    }
    
    // Handle images
    if ($request->hasFile('images')) {
        foreach ($request->file('images') as $image) {
            $path = $image->store('properties', 'public');
            $property->image()->create(['image' => $path]);
        }
    }
    
    return redirect()->route('admin.properties.index')
                   ->with('success', 'Property created successfully');
}
```

#### Property Management Features
- **Property Listing**: View all properties with filters
- **Property Editing**: Comprehensive property editing
- **Image Management**: Upload and manage property images
- **Amenity Management**: Add and manage property amenities
- **Investment Tracking**: Monitor property investment progress
- **Performance Analytics**: Property performance metrics

### Property Status Management

#### Status Types
- **Draft**: Property being prepared
- **Active**: Available for investment
- **Funded**: Fully funded
- **Completed**: Investment period completed
- **Cancelled**: Property investment cancelled

#### Status Workflows
```php
public function updatePropertyStatus($propertyId, $status) {
    $property = Property::findOrFail($propertyId);
    
    // Validate status transition
    if (!$this->isValidStatusTransition($property->status, $status)) {
        throw new InvalidStatusTransitionException();
    }
    
    $property->update(['status' => $status]);
    
    // Handle status-specific actions
    switch ($status) {
        case 'active':
            $this->activateProperty($property);
            break;
        case 'funded':
            $this->handlePropertyFunded($property);
            break;
        case 'completed':
            $this->completeProperty($property);
            break;
    }
}
```

## Investment Management

### Investment Overview

#### Investment Dashboard
- **Total Investments**: Platform-wide investment statistics
- **Active Investments**: Currently active investments
- **Investment Distribution**: Investment distribution across properties
- **Return Performance**: Investment return analytics
- **Investor Analytics**: Top investors and investment patterns

#### Investment Tracking
```php
// Investment analytics
public function getInvestmentAnalytics() {
    return [
        'total_invested' => Investment::sum('amount'),
        'average_investment' => Investment::avg('amount'),
        'total_returns_paid' => Investment::sum('returns_earned'),
        'active_investments' => Investment::where('status', 'active')->count(),
        'investment_by_property' => Investment::select('property_id')
                                             ->selectRaw('SUM(amount) as total')
                                             ->groupBy('property_id')
                                             ->with('property')
                                             ->get(),
        'monthly_investments' => Investment::selectRaw('MONTH(created_at) as month, SUM(amount) as total')
                                          ->groupBy('month')
                                          ->get()
    ];
}
```

### Return Management

#### Return Calculation
```php
// Automated return calculation
public function calculateReturns($propertyId) {
    $property = Property::findOrFail($propertyId);
    $investments = $property->investments()->where('status', 'active')->get();
    
    foreach ($investments as $investment) {
        $monthsElapsed = $investment->created_at->diffInMonths(now());
        $monthlyReturnRate = $property->expected_return_rate / 12 / 100;
        $monthlyReturn = $investment->amount * $monthlyReturnRate;
        
        // Create return transaction
        Transaction::create([
            'user_id' => $investment->user_id,
            'amount' => $monthlyReturn,
            'type' => 'return',
            'description' => "Return for {$property->title}",
            'investment_id' => $investment->id
        ]);
        
        // Update user balance
        $investment->user->increment('balance', $monthlyReturn);
        
        // Update investment returns
        $investment->increment('returns_earned', $monthlyReturn);
    }
}
```

#### Return Distribution
- **Automated Returns**: Scheduled return payments
- **Manual Returns**: Admin-initiated return payments
- **Return History**: Complete return payment history
- **Return Analytics**: Return performance metrics

## Financial Management

### Transaction Management

#### Transaction Overview
```php
// Financial transaction management
public function getTransactionOverview() {
    return [
        'total_deposits' => Deposit::where('status', 'completed')->sum('amount'),
        'total_withdrawals' => Payout::where('status', 'completed')->sum('amount'),
        'pending_deposits' => Deposit::where('status', 'pending')->sum('amount'),
        'pending_withdrawals' => Payout::where('status', 'pending')->sum('amount'),
        'platform_revenue' => $this->calculatePlatformRevenue(),
        'transaction_fees' => $this->calculateTransactionFees()
    ];
}
```

#### Transaction Types
- **Deposits**: User fund deposits
- **Withdrawals**: User fund withdrawals
- **Investments**: Property investments
- **Returns**: Investment returns
- **Referral Bonuses**: Referral commissions
- **Transfers**: Internal money transfers

### Deposit Management

#### Deposit Processing
```php
public function processDeposit($depositId, $action) {
    $deposit = Deposit::findOrFail($depositId);
    
    switch ($action) {
        case 'approve':
            $deposit->update(['status' => 'completed']);
            $deposit->user->increment('balance', $deposit->amount);
            $deposit->user->notify(new DepositApproved($deposit));
            break;
            
        case 'reject':
            $deposit->update(['status' => 'rejected']);
            $deposit->user->notify(new DepositRejected($deposit));
            break;
    }
    
    // Log admin action
    AdminLog::create([
        'admin_id' => auth()->id(),
        'action' => "deposit_{$action}",
        'target_id' => $depositId,
        'amount' => $deposit->amount
    ]);
}
```

### Withdrawal Management

#### Withdrawal Processing
- **Pending Withdrawals**: Review and process withdrawal requests
- **Withdrawal Limits**: Configure withdrawal limits and restrictions
- **Processing Fees**: Set and manage withdrawal fees
- **Batch Processing**: Process multiple withdrawals simultaneously
- **Fraud Detection**: Automated fraud detection for withdrawals

## Payment Gateway Management

### Gateway Configuration

#### Supported Gateways
The platform supports 35+ payment gateways including:

```php
// Payment gateway configuration
$gateways = [
    'stripe' => [
        'name' => 'Stripe',
        'currencies' => ['USD', 'EUR', 'GBP'],
        'methods' => ['card', 'bank_transfer'],
        'fees' => ['percentage' => 2.9, 'fixed' => 0.30]
    ],
    'paypal' => [
        'name' => 'PayPal',
        'currencies' => ['USD', 'EUR', 'GBP'],
        'methods' => ['paypal', 'card'],
        'fees' => ['percentage' => 3.4, 'fixed' => 0.30]
    ],
    'razorpay' => [
        'name' => 'Razorpay',
        'currencies' => ['INR'],
        'methods' => ['card', 'netbanking', 'upi'],
        'fees' => ['percentage' => 2.0, 'fixed' => 0]
    ]
];
```

#### Gateway Management
- **Enable/Disable**: Control gateway availability
- **Configuration**: Set API keys and credentials
- **Fee Structure**: Configure processing fees
- **Currency Support**: Manage supported currencies
- **Method Restrictions**: Control available payment methods

### Gateway Monitoring

#### Transaction Monitoring
- **Success Rates**: Gateway success rate monitoring
- **Processing Times**: Average processing time tracking
- **Error Analysis**: Payment failure analysis
- **Revenue Tracking**: Revenue by payment gateway

## KYC Management

### KYC Review System

#### Document Review Process
```php
public function reviewKycDocument($kycId, $action, $reason = null) {
    $kyc = UserKyc::findOrFail($kycId);
    
    switch ($action) {
        case 'approve':
            $kyc->update(['status' => 'approved']);
            $kyc->user->update([
                'identity_verify' => 1,
                'address_verify' => $kyc->type === 'address' ? 1 : $kyc->user->address_verify
            ]);
            break;
            
        case 'reject':
            $kyc->update([
                'status' => 'rejected',
                'rejection_reason' => $reason
            ]);
            break;
            
        case 'request_resubmission':
            $kyc->update([
                'status' => 'resubmission_required',
                'rejection_reason' => $reason
            ]);
            break;
    }
    
    // Notify user
    $kyc->user->notify(new KycStatusUpdated($kyc, $action));
}
```

#### KYC Analytics
- **Verification Statistics**: KYC completion rates
- **Processing Times**: Average KYC processing time
- **Rejection Analysis**: Common rejection reasons
- **Compliance Reporting**: Regulatory compliance reports

## Content Management

### Website Content

#### Page Management
```php
// Dynamic page management
public function createPage(Request $request) {
    $request->validate([
        'name' => 'required|string|max:255',
        'slug' => 'required|string|unique:pages',
        'content' => 'required|array',
        'status' => 'required|boolean',
        'meta_title' => 'nullable|string|max:255',
        'meta_description' => 'nullable|string|max:500'
    ]);
    
    Page::create([
        'name' => $request->name,
        'slug' => $request->slug,
        'content' => $request->content,
        'status' => $request->status,
        'meta_title' => $request->meta_title,
        'meta_description' => $request->meta_description
    ]);
}
```

#### Content Features
- **Dynamic Pages**: Create and manage custom pages
- **Blog System**: Complete blog management system
- **SEO Management**: Meta tags and SEO optimization
- **Multi-language Content**: Manage content in multiple languages
- **Media Management**: Upload and manage media files

### Blog Management

#### Blog Features
- **Post Management**: Create, edit, and publish blog posts
- **Category Management**: Organize posts with categories
- **Author Management**: Multiple author support
- **SEO Optimization**: Built-in SEO features
- **Comment System**: User comment management
- **Social Sharing**: Social media integration

## System Configuration

### Basic Settings

#### Site Configuration
```php
// Basic site configuration
public function updateBasicSettings(Request $request) {
    $settings = [
        'site_name' => $request->site_name,
        'site_title' => $request->site_title,
        'site_description' => $request->site_description,
        'primary_color' => $request->primary_color,
        'secondary_color' => $request->secondary_color,
        'currency_symbol' => $request->currency_symbol,
        'currency_code' => $request->currency_code,
        'timezone' => $request->timezone,
        'date_format' => $request->date_format,
        'time_format' => $request->time_format
    ];
    
    foreach ($settings as $key => $value) {
        BasicControl::updateOrCreate(
            ['name' => $key],
            ['value' => $value]
        );
    }
}
```

### Email Configuration

#### Email Settings
- **SMTP Configuration**: Configure SMTP settings
- **Email Templates**: Manage email templates
- **Email Queue**: Monitor email queue
- **Delivery Tracking**: Track email delivery status
- **Bounce Handling**: Handle email bounces

### SMS Configuration

#### SMS Providers
- **Twilio**: SMS via Twilio
- **Vonage**: SMS via Vonage (Nexmo)
- **Plivo**: SMS via Plivo
- **Custom Gateway**: Custom SMS gateway integration

### Notification Configuration

#### Notification Channels
- **Email Notifications**: Configure email notifications
- **SMS Notifications**: Configure SMS notifications
- **Push Notifications**: Configure Firebase push notifications
- **In-app Notifications**: Configure in-app notifications

## Reports & Analytics

### Financial Reports

#### Revenue Reports
```php
// Revenue analytics
public function getRevenueReport($period = 'monthly') {
    $query = Transaction::where('type', 'fee');
    
    switch ($period) {
        case 'daily':
            return $query->selectRaw('DATE(created_at) as date, SUM(amount) as total')
                        ->groupBy('date')
                        ->orderBy('date')
                        ->get();
        case 'monthly':
            return $query->selectRaw('YEAR(created_at) as year, MONTH(created_at) as month, SUM(amount) as total')
                        ->groupBy('year', 'month')
                        ->orderBy('year', 'month')
                        ->get();
    }
}
```

#### Investment Reports
- **Investment Performance**: ROI and performance metrics
- **Property Analysis**: Property-wise investment analysis
- **User Investment Patterns**: User investment behavior analysis
- **Return Distribution**: Return payment analysis

### User Analytics

#### User Behavior
- **Registration Trends**: User registration patterns
- **Activity Analysis**: User activity and engagement
- **Retention Analysis**: User retention metrics
- **Geographic Distribution**: User location analysis

### System Reports

#### Performance Reports
- **System Performance**: Server and database performance
- **Error Reports**: System error analysis
- **Security Reports**: Security incident reports
- **Compliance Reports**: Regulatory compliance reports

## Support System

### Ticket Management

#### Support Ticket System
```php
// Support ticket management
public function assignTicket($ticketId, $adminId) {
    $ticket = SupportTicket::findOrFail($ticketId);
    
    $ticket->update([
        'assigned_to' => $adminId,
        'status' => 'in_progress'
    ]);
    
    // Notify assigned admin
    $admin = Admin::findOrFail($adminId);
    $admin->notify(new TicketAssigned($ticket));
    
    // Notify user
    $ticket->user->notify(new TicketStatusUpdated($ticket));
}
```

#### Ticket Features
- **Ticket Assignment**: Assign tickets to admin staff
- **Priority Management**: Set ticket priorities
- **Status Tracking**: Track ticket status and progress
- **Response Templates**: Pre-defined response templates
- **Escalation Rules**: Automatic ticket escalation
- **SLA Management**: Service level agreement tracking

### Communication Tools

#### Bulk Communication
- **Email Campaigns**: Send bulk emails to users
- **SMS Campaigns**: Send bulk SMS messages
- **Push Notifications**: Send bulk push notifications
- **Targeted Messaging**: Send messages to specific user segments

## Security Management

### Security Monitoring

#### Login Security
```php
// Security monitoring
public function monitorSuspiciousActivity() {
    // Multiple failed login attempts
    $suspiciousLogins = UserLogin::where('created_at', '>', now()->subHour())
                                 ->where('status', 'failed')
                                 ->groupBy('ip_address')
                                 ->havingRaw('COUNT(*) > 5')
                                 ->get();
    
    foreach ($suspiciousLogins as $login) {
        SecurityAlert::create([
            'type' => 'suspicious_login',
            'ip_address' => $login->ip_address,
            'details' => "Multiple failed login attempts from IP: {$login->ip_address}"
        ]);
    }
}
```

#### Security Features
- **IP Blocking**: Block suspicious IP addresses
- **Rate Limiting**: Implement rate limiting
- **Fraud Detection**: Automated fraud detection
- **Security Alerts**: Real-time security alerts
- **Audit Logging**: Complete audit trail
- **Compliance Monitoring**: Regulatory compliance monitoring

### Access Control

#### Admin Permissions
- **Role-based Access**: Granular permission system
- **Activity Logging**: Log all admin activities
- **Session Management**: Secure admin session handling
- **Multi-factor Authentication**: 2FA for admin accounts

---

## Best Practices

### Administration
1. **Regular Monitoring**: Monitor system health and performance regularly
2. **Security Updates**: Keep system and dependencies updated
3. **Backup Strategy**: Implement comprehensive backup strategy
4. **Documentation**: Maintain detailed system documentation

### User Management
1. **Fair Treatment**: Treat all users fairly and transparently
2. **Prompt Support**: Respond to user inquiries promptly
3. **Clear Communication**: Communicate changes and updates clearly
4. **Privacy Protection**: Protect user privacy and data

### Financial Management
1. **Accurate Records**: Maintain accurate financial records
2. **Regular Reconciliation**: Reconcile accounts regularly
3. **Fraud Prevention**: Implement robust fraud prevention measures
4. **Compliance**: Ensure regulatory compliance

This comprehensive admin guide provides administrators with all the tools and knowledge needed to effectively manage the Real Estate Investment Platform.