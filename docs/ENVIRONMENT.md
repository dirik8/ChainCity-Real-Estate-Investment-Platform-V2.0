## Environment Configuration

Populate `.env` with the following keys as needed.

### Core
- APP_NAME, APP_ENV, APP_KEY, APP_DEBUG, APP_URL
- LOG_CHANNEL, LOG_LEVEL

### Database
- DB_CONNECTION, DB_HOST, DB_PORT, DB_DATABASE, DB_USERNAME, DB_PASSWORD

### Cache, Queue, Session
- CACHE_DRIVER, SESSION_DRIVER, SESSION_LIFETIME
- QUEUE_CONNECTION (e.g., database, redis)
- REDIS_HOST, REDIS_PASSWORD, REDIS_PORT (if using Redis)

### Mail (choose one provider)
- MAIL_MAILER, MAIL_HOST, MAIL_PORT, MAIL_USERNAME, MAIL_PASSWORD, MAIL_ENCRYPTION, MAIL_FROM_ADDRESS, MAIL_FROM_NAME
- Or service keys from `config/services.php` and `config/mailconfig.php`:
  - MAILGUN_DOMAIN, MAILGUN_SECRET
  - POSTMARK_TOKEN
  - SENDGRID_API_KEY
  - SENDINBLUE_API_KEY
  - AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION, AWS_SESSION_TOKEN
  - MAILERSEND_API_KEY, MAILCHIMP_API_KEY

### SMS (choose one)
- TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN, TWILIO_PHONE_NUMBER
- INFOBIP_API_KEY, INFOBIP_BASE_URL
- PLIVO_ID, PLIVO_AUTH_ID, PLIVO_AUTH_TOKEN
- VONAGE_API_KEY, VONAGE_API_SECRET
- SMS_METHOD=manual|twilio|infobip|plivo|vonage

### Firebase (FCM)
- FIREBASE_SERVER_KEY, FIREBASE_VAPID_KEY
- FIREBASE_API_KEY, FIREBASE_AUTH_DOMAIN, FIREBASE_PROJECT_ID, FIREBASE_STORAGE_BUCKET
- FIREBASE_MESSAGING_SENDER_ID, FIREBASE_API_ID, FIREBASE_MEASUREMENT_ID
- ADMIN_FOREGROUND, ADMIN_BACKGROUND, USER_FOREGROUND, USER_BACKGROUND

Place the web push service worker at `/firebase-messaging-sw.js` and initialize Firebase in the frontend using the above keys.

### Pusher (Realtime)
- PUSHER_APP_ID, PUSHER_APP_KEY, PUSHER_APP_SECRET, PUSHER_APP_CLUSTER
- Optional: PUSHER_HOST, PUSHER_PORT, PUSHER_SCHEME

### Social Login (Socialite)
- GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET, GOOGLE_REDIRECT_URL
- FACEBOOK_CLIENT_ID, FACEBOOK_CLIENT_SECRET, FACEBOOK_REDIRECT_URL
- GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET, GITHUB_REDIRECT

### Google reCAPTCHA
- GOOGLE_RECAPTCHA_SITE_KEY, GOOGLE_RECAPTCHA_SECRET_KEY, GOOGLE_RECAPTCHA_SITE_VERIFY_URL

### Storage (optional S3)
- FILESYSTEM_DISK=local|s3
- AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION, AWS_BUCKET, AWS_URL

### Payments & Payouts
Keys depend on enabled gateways (Stripe, Razorpay, Mollie, Flutterwave, Paystack, Midtrans, CoinGate, CinetPay, Authorize.Net). Configure each gateway within the admin panel and/or via dedicated env vars per gateway package.

### Notes
- Never commit private keys (e.g., Firebase service accounts) to the repository. Use environment variables or secure secret storage.

