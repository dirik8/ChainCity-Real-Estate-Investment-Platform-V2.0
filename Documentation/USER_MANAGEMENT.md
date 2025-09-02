# User Management System Documentation

This document covers the comprehensive user management system, including authentication, KYC verification, profile management, and user features.

## Table of Contents

1. [Overview](#overview)
2. [User Authentication](#user-authentication)
3. [User Registration](#user-registration)
4. [KYC Verification](#kyc-verification)
5. [User Profiles](#user-profiles)
6. [Two-Factor Authentication](#two-factor-authentication)
7. [Social Login](#social-login)
8. [User Roles & Permissions](#user-roles--permissions)
9. [Referral System](#referral-system)
10. [Ranking System](#ranking-system)
11. [User Dashboard](#user-dashboard)
12. [Account Management](#account-management)

## Overview

The User Management System provides comprehensive user account functionality with advanced security features, KYC compliance, and social features. The system supports multiple authentication methods, role-based access control, and extensive user profile management.

### Key Features
- **Multi-factor Authentication**: Email, SMS, and 2FA support
- **KYC Compliance**: Complete identity and address verification
- **Social Login**: Integration with major social platforms
- **Role-based Access**: Granular permission system
- **Referral Program**: Multi-level referral system with commissions
- **User Ranking**: Activity-based user ranking system
- **Profile Management**: Comprehensive user profile features

## User Authentication

### Authentication Methods

#### Email/Password Authentication
```php
// Login process
public function login(Request $request) {
    $credentials = $request->validate([
        'email' => 'required|email',
        'password' => 'required|string'
    ]);
    
    if (Auth::attempt($credentials)) {
        $user = Auth::user();
        
        // Check if email is verified
        if (!$user->email_verified_at) {
            return redirect()->route('verification.notice');
        }
        
        // Check if 2FA is enabled
        if ($user->two_fa) {
            return redirect()->route('2fa.verify');
        }
        
        return redirect()->route('user.dashboard');
    }
    
    return back()->withErrors(['email' => 'Invalid credentials']);
}
```

#### Multi-factor Authentication Flow
1. **Primary Authentication**: Email/password verification
2. **Email Verification**: Verify email address if not verified
3. **2FA Verification**: Two-factor authentication if enabled
4. **Login Success**: Redirect to dashboard

### Password Security

#### Password Requirements
- Minimum 8 characters
- At least one uppercase letter
- At least one lowercase letter
- At least one number
- At least one special character

#### Password Reset Process
```php
// Password reset flow
public function sendResetLinkEmail(Request $request) {
    $request->validate(['email' => 'required|email']);
    
    $status = Password::sendResetLink(
        $request->only('email')
    );
    
    return $status === Password::RESET_LINK_SENT
        ? back()->with(['status' => __($status)])
        : back()->withErrors(['email' => __($status)]);
}
```

### Session Management

- **Session Timeout**: Configurable session timeout
- **Remember Me**: Optional persistent login
- **Device Tracking**: Track user login devices
- **Session Security**: Secure session handling

## User Registration

### Registration Process

#### Step 1: Basic Information
```php
// User registration
public function register(Request $request) {
    $request->validate([
        'firstname' => 'required|string|max:255',
        'lastname' => 'required|string|max:255',
        'username' => 'required|string|max:255|unique:users',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|confirmed',
        'country_code' => 'required|string',
        'phone' => 'required|string',
        'referral_id' => 'nullable|string|exists:users,username'
    ]);
    
    $user = User::create([
        'firstname' => $request->firstname,
        'lastname' => $request->lastname,
        'username' => $request->username,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'country_code' => $request->country_code,
        'phone' => $request->phone,
        'referral_id' => $request->referral_id,
        'verify_code' => rand(100000, 999999),
    ]);
    
    // Send verification email
    $user->sendEmailVerificationNotification();
    
    return redirect()->route('verification.notice');
}
```

#### Step 2: Email Verification
- **Verification Email**: Automated email with verification link
- **Verification Code**: 6-digit verification code
- **Resend Options**: Option to resend verification email
- **Expiration**: Verification links expire after 24 hours

#### Step 3: Phone Verification (Optional)
- **SMS Verification**: SMS-based phone verification
- **International Support**: Support for international phone numbers
- **Multiple Providers**: Twilio, Vonage, Plivo integration

### Registration Validation

#### Email Validation
- Valid email format
- Unique email address
- Disposable email detection
- Domain blacklisting

#### Username Validation
- Unique username
- Alphanumeric characters only
- Length restrictions (3-20 characters)
- Reserved username protection

#### Phone Validation
- Valid phone number format
- International format support
- Duplicate phone number detection

## KYC Verification

### KYC Process Overview

The KYC (Know Your Customer) system ensures compliance with financial regulations and user verification requirements.

#### KYC Levels
1. **Level 0**: Basic registration (limited functionality)
2. **Level 1**: Identity verification (standard functionality)
3. **Level 2**: Address verification (full functionality)
4. **Level 3**: Enhanced verification (premium features)

### Identity Verification

#### Required Documents
```php
// KYC document types
$identityDocuments = [
    'passport' => 'Passport',
    'driving_license' => 'Driving License',
    'national_id' => 'National ID Card',
    'voter_id' => 'Voter ID Card'
];
```

#### Document Upload Process
1. **Document Selection**: Choose document type
2. **File Upload**: Upload clear document images
3. **Information Entry**: Enter document details
4. **Submission**: Submit for verification
5. **Review**: Admin review and approval

#### Document Requirements
- **Image Quality**: Clear, high-resolution images
- **File Formats**: JPG, PNG, PDF supported
- **File Size**: Maximum 5MB per file
- **Document Validity**: Must be valid and not expired

### Address Verification

#### Proof of Address Documents
```php
$addressDocuments = [
    'utility_bill' => 'Utility Bill',
    'bank_statement' => 'Bank Statement',
    'rental_agreement' => 'Rental Agreement',
    'government_letter' => 'Government Letter'
];
```

#### Address Verification Process
1. **Document Upload**: Upload proof of address
2. **Address Details**: Enter complete address information
3. **Verification**: Document review and verification
4. **Approval**: Address verification approval

### KYC Status Management

#### Status Types
- **Pending**: KYC documents submitted, awaiting review
- **Under Review**: Documents being reviewed by admin
- **Approved**: KYC verification completed
- **Rejected**: Documents rejected, resubmission required
- **Expired**: KYC verification expired, renewal required

#### KYC Restrictions
```php
// Feature restrictions based on KYC status
public function canInvest() {
    return $this->identity_verify === 1;
}

public function canWithdraw() {
    return $this->identity_verify === 1 && $this->address_verify === 1;
}

public function getInvestmentLimit() {
    if ($this->identity_verify && $this->address_verify) {
        return 100000; // Full limit
    } elseif ($this->identity_verify) {
        return 10000; // Limited
    }
    return 1000; // Basic limit
}
```

## User Profiles

### Profile Information

#### Basic Profile Data
```php
// User profile structure
class User extends Authenticatable {
    protected $fillable = [
        'firstname',
        'lastname',
        'username',
        'email',
        'phone',
        'country_code',
        'country',
        'state',
        'city',
        'zip_code',
        'address_one',
        'address_two',
        'image',
        'time_zone',
        'language_id'
    ];
}
```

#### Profile Management Features
- **Personal Information**: Name, contact details, address
- **Profile Image**: Upload and manage profile pictures
- **Preferences**: Language, timezone, notification settings
- **Security Settings**: Password, 2FA, login devices
- **Privacy Settings**: Profile visibility, data sharing preferences

### Profile Completion

#### Profile Completion Tracking
```php
public function getProfileCompletionAttribute() {
    $fields = [
        'firstname', 'lastname', 'email', 'phone',
        'country', 'state', 'city', 'address_one', 'image'
    ];
    
    $completed = 0;
    foreach ($fields as $field) {
        if (!empty($this->$field)) {
            $completed++;
        }
    }
    
    return ($completed / count($fields)) * 100;
}
```

#### Profile Completion Benefits
- **Higher Limits**: Increased investment and withdrawal limits
- **Better Support**: Priority customer support
- **Enhanced Features**: Access to premium features
- **Trust Score**: Higher trust score for referrals

## Two-Factor Authentication

### 2FA Setup Process

#### TOTP (Time-based One-Time Password)
```php
use PragmaRX\Google2FA\Google2FA;

public function enable2FA() {
    $google2fa = new Google2FA();
    $secretKey = $google2fa->generateSecretKey();
    
    $this->user->update([
        'two_fa_code' => $secretKey,
        'two_fa' => 0 // Not verified yet
    ]);
    
    $qrCodeUrl = $google2fa->getQRCodeUrl(
        config('app.name'),
        $this->user->email,
        $secretKey
    );
    
    return view('user.2fa.setup', compact('qrCodeUrl', 'secretKey'));
}
```

#### 2FA Verification
```php
public function verify2FA(Request $request) {
    $request->validate([
        'code' => 'required|string|size:6'
    ]);
    
    $google2fa = new Google2FA();
    $valid = $google2fa->verifyKey(
        auth()->user()->two_fa_code,
        $request->code
    );
    
    if ($valid) {
        auth()->user()->update(['two_fa' => 1]);
        return redirect()->route('user.dashboard')
            ->with('success', '2FA enabled successfully');
    }
    
    return back()->withErrors(['code' => 'Invalid 2FA code']);
}
```

### 2FA Recovery

#### Backup Codes
- **Generation**: Generate 10 backup codes
- **Usage**: Single-use recovery codes
- **Storage**: Securely store backup codes
- **Regeneration**: Option to regenerate codes

#### 2FA Disable Process
1. **Current Password**: Verify current password
2. **2FA Code**: Enter current 2FA code
3. **Confirmation**: Confirm 2FA disable
4. **Disable**: Remove 2FA from account

## Social Login

### Supported Platforms

#### OAuth Providers
```php
// Supported social login providers
$providers = [
    'google' => 'Google',
    'facebook' => 'Facebook',
    'twitter' => 'Twitter',
    'linkedin' => 'LinkedIn',
    'github' => 'GitHub'
];
```

### Social Login Process

#### OAuth Flow
```php
public function redirectToProvider($provider) {
    return Socialite::driver($provider)->redirect();
}

public function handleProviderCallback($provider) {
    try {
        $socialUser = Socialite::driver($provider)->user();
        
        // Check if user exists
        $existingUser = User::where('email', $socialUser->getEmail())->first();
        
        if ($existingUser) {
            // Link social account
            $existingUser->update([
                'provider' => $provider,
                'provider_id' => $socialUser->getId()
            ]);
            
            Auth::login($existingUser);
        } else {
            // Create new user
            $user = User::create([
                'firstname' => $socialUser->getName(),
                'email' => $socialUser->getEmail(),
                'provider' => $provider,
                'provider_id' => $socialUser->getId(),
                'email_verified_at' => now()
            ]);
            
            Auth::login($user);
        }
        
        return redirect()->route('user.dashboard');
        
    } catch (Exception $e) {
        return redirect()->route('login')
            ->withErrors(['error' => 'Social login failed']);
    }
}
```

### Social Account Management

#### Account Linking
- **Link Accounts**: Connect social accounts to existing account
- **Multiple Providers**: Support multiple social login methods
- **Account Unlinking**: Disconnect social accounts
- **Primary Email**: Maintain primary email address

## User Roles & Permissions

### Role System

#### Default Roles
```php
// User roles
$roles = [
    'user' => 'Regular User',
    'admin' => 'Administrator',
    'moderator' => 'Moderator',
    'investor' => 'Premium Investor',
    'agent' => 'Property Agent'
];
```

#### Role Management
```php
class Role extends Model {
    protected $fillable = [
        'name',
        'permissions',
        'status'
    ];
    
    protected $casts = [
        'permissions' => 'array'
    ];
}
```

### Permission System

#### Permission Categories
- **Property Management**: View, create, edit, delete properties
- **Investment Management**: Make investments, view investments
- **Financial Operations**: Deposits, withdrawals, transfers
- **User Management**: View users, edit profiles
- **Administrative**: System settings, reports

#### Permission Checking
```php
// Middleware for permission checking
public function handle($request, Closure $next, $permission) {
    if (!auth()->user()->hasPermission($permission)) {
        abort(403, 'Unauthorized action');
    }
    
    return $next($request);
}

// User model method
public function hasPermission($permission) {
    return in_array($permission, $this->role->permissions ?? []);
}
```

## Referral System

### Referral Structure

#### Multi-level Referrals
```php
class User extends Model {
    public function referrer() {
        return $this->belongsTo(User::class, 'referral_id', 'username');
    }
    
    public function referrals() {
        return $this->hasMany(User::class, 'referral_id', 'username');
    }
    
    public function getReferralTreeAttribute() {
        return $this->referrals()->with('referrals')->get();
    }
}
```

#### Referral Commission Calculation
```php
public function calculateReferralCommission($amount, $level = 1) {
    $rates = [
        1 => 5.0,  // 5% for direct referrals
        2 => 2.0,  // 2% for second level
        3 => 1.0,  // 1% for third level
    ];
    
    $rate = $rates[$level] ?? 0;
    return ($amount * $rate) / 100;
}
```

### Referral Tracking

#### Referral Statistics
- **Total Referrals**: Count of direct and indirect referrals
- **Active Referrals**: Currently active referred users
- **Referral Earnings**: Total earnings from referrals
- **Commission History**: Detailed commission history

#### Referral Bonuses
```php
class ReferralBonus extends Model {
    protected $fillable = [
        'user_id',
        'referred_user_id',
        'amount',
        'commission_rate',
        'level',
        'type',
        'status'
    ];
}
```

## Ranking System

### User Ranking

#### Ranking Criteria
```php
class Rank extends Model {
    protected $fillable = [
        'title',
        'minimum_investment',
        'minimum_referrals',
        'benefits',
        'icon',
        'status'
    ];
    
    protected $casts = [
        'benefits' => 'array'
    ];
}
```

#### Rank Calculation
```php
public function calculateUserRank() {
    $totalInvestment = $this->investments()->sum('amount');
    $totalReferrals = $this->referrals()->count();
    
    $rank = Rank::where('minimum_investment', '<=', $totalInvestment)
                ->where('minimum_referrals', '<=', $totalReferrals)
                ->orderBy('minimum_investment', 'desc')
                ->first();
    
    return $rank ?? Rank::where('minimum_investment', 0)->first();
}
```

### Ranking Benefits

#### Rank-based Benefits
- **Higher Limits**: Increased investment and withdrawal limits
- **Better Rates**: Improved investment return rates
- **Priority Support**: Priority customer support
- **Exclusive Properties**: Access to exclusive investment opportunities
- **Reduced Fees**: Lower transaction and processing fees

## User Dashboard

### Dashboard Overview

#### Key Metrics
```php
// Dashboard data compilation
public function getDashboardData() {
    return [
        'total_investments' => $this->investments()->sum('amount'),
        'active_investments' => $this->investments()->where('status', 'active')->count(),
        'total_returns' => $this->investments()->sum('returns_earned'),
        'pending_withdrawals' => $this->payouts()->where('status', 'pending')->sum('amount'),
        'referral_count' => $this->referrals()->count(),
        'referral_earnings' => $this->referralBonuses()->sum('amount'),
        'current_rank' => $this->calculateUserRank(),
        'recent_transactions' => $this->transactions()->latest()->take(5)->get()
    ];
}
```

#### Dashboard Sections
- **Investment Portfolio**: Overview of all investments
- **Financial Summary**: Balance, returns, transactions
- **Referral Network**: Referral statistics and earnings
- **Account Status**: KYC status, verification levels
- **Recent Activity**: Latest account activities
- **Quick Actions**: Common user actions

### Dashboard Widgets

#### Investment Widget
- **Total Investment Value**: Sum of all investments
- **Active Investments**: Currently active investments
- **Investment Performance**: ROI and performance metrics
- **Investment Distribution**: Pie chart of investment allocation

#### Financial Widget
- **Account Balance**: Current account balance
- **Pending Returns**: Expected return payments
- **Transaction History**: Recent financial transactions
- **Withdrawal Status**: Pending and completed withdrawals

## Account Management

### Account Settings

#### Security Settings
```php
// Security settings management
public function updateSecuritySettings(Request $request) {
    $request->validate([
        'current_password' => 'required|current_password',
        'password' => 'nullable|string|min:8|confirmed',
        'two_fa_enabled' => 'boolean',
        'login_notifications' => 'boolean'
    ]);
    
    $updates = [];
    
    if ($request->password) {
        $updates['password'] = Hash::make($request->password);
    }
    
    if ($request->has('two_fa_enabled')) {
        $updates['two_fa'] = $request->two_fa_enabled;
    }
    
    auth()->user()->update($updates);
}
```

#### Notification Settings
- **Email Notifications**: Configure email notification preferences
- **SMS Notifications**: Configure SMS notification preferences
- **Push Notifications**: Configure mobile push notifications
- **Notification Types**: Investment updates, security alerts, marketing

#### Privacy Settings
- **Profile Visibility**: Control profile visibility
- **Data Sharing**: Manage data sharing preferences
- **Activity Tracking**: Control activity tracking
- **Third-party Access**: Manage third-party application access

### Account Deactivation

#### Deactivation Process
1. **Verification**: Verify account ownership
2. **Outstanding Balance**: Handle remaining balance
3. **Active Investments**: Manage active investments
4. **Data Retention**: Configure data retention preferences
5. **Confirmation**: Confirm account deactivation

#### Reactivation Process
- **Identity Verification**: Re-verify identity
- **Security Check**: Security verification process
- **Account Recovery**: Restore account data
- **Notification**: Account reactivation notification

---

## Best Practices

### User Security
1. **Strong Passwords**: Enforce strong password policies
2. **2FA Implementation**: Encourage two-factor authentication
3. **Session Security**: Implement secure session management
4. **Login Monitoring**: Monitor and alert on suspicious login activity

### KYC Compliance
1. **Document Verification**: Implement thorough document verification
2. **Regular Updates**: Regular KYC information updates
3. **Compliance Monitoring**: Monitor compliance requirements
4. **Risk Assessment**: Implement risk-based verification

### User Experience
1. **Intuitive Interface**: Design user-friendly interfaces
2. **Clear Communication**: Provide clear instructions and feedback
3. **Progressive Disclosure**: Implement progressive information disclosure
4. **Mobile Optimization**: Optimize for mobile devices

This comprehensive user management system provides secure, compliant, and user-friendly account management with advanced features for authentication, verification, and user engagement.