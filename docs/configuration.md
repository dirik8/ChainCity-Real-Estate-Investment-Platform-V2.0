## Configuration & Environment

Key environment variables (see `.env.example`):

- App: `APP_NAME`, `APP_ENV`, `APP_KEY`, `APP_URL`, `APP_TIMEZONE`
- Database: `DB_CONNECTION`, `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`
- Cache/Queue: `CACHE_DRIVER`, `SESSION_DRIVER`, `QUEUE_CONNECTION`
- Mail: `MAIL_MAILER`, `MAIL_HOST`, `MAIL_PORT`, `MAIL_USERNAME`, `MAIL_PASSWORD`, `MAIL_ENCRYPTION`, `MAIL_FROM_*`, plus providers (Mailgun, Postmark, SES, Sendgrid, Sendinblue, MailerSend, Mandrill) per `config/mail.php` and `config/mailconfig.php`
- Pusher (In-App): `PUSHER_*` per `config/pusher.php`
- Firebase (Push): `FIREBASE_*` per `config/firebase.php`
- Socialite: `GOOGLE_*`, `FACEBOOK_*`, `GITHUB_*` per `config/services.php`
- SMS: `SMS_METHOD`, Twilio/Infobip/Plivo/Vonage keys per `config/SMSConfig.php`
- Translate: `TRANSLATE_METHOD`, Azure keys per `config/translateconfig.php`
- Currency: see admin Exchange API settings (CurrencyLayer, CoinMarketCap)

Admin settings panels are defined in `config/generalsettings.php` and cover: basic control, logos, notifications (push, in-app, email, SMS), languages, storage, exchange API, translate API, plugins, maintenance mode, Socialite.
