## Notifications

### Email
- Configured via `config/mail.php` and admin Email Controls
- Supports SMTP, SES, Mailgun, Postmark, Sendgrid, Sendinblue, MailerSend, Mandrill
- Templates managed via Admin > Email Templates and Default Templates

### SMS
- Providers: Twilio, Infobip, Plivo, Vonage; configured via `config/SMSConfig.php`
- Templates under Admin > SMS Templates

### In-App (Pusher)
- Configure keys in `.env` matching `config/pusher.php`
- Admin and User can manage notifications and mark as read

### Push (Firebase)
- Keys in `.env` matching `config/firebase.php`
- Web push via `firebase-messaging-sw.js`, topics per admin/user foreground/background colors

### In-App Templates
- Admin can manage templates: email, SMS, in-app, push under Notification Templates
