## Notifications

### In-App Notifications
- Model: `InAppNotification`
- Templates managed in Admin > Notification Templates (email, SMS, in-app, push)
- User routes to show/read/readAll under `/user/*`, admin equivalents in `/admin/*`

### Push Notifications (Firebase Cloud Messaging)
- Service worker at `/firebase-messaging-sw.js`
- Config keys in `config/firebase.php`: `FIREBASE_*`, plus per-role foreground/background flags
- Save FCM tokens via `save-token` endpoints (user/admin)
- Background handler shows notifications when `payload.notification.background == 1`

### Realtime (Pusher)
- Config in `config/pusher.php`
- Required keys: `PUSHER_APP_ID`, `PUSHER_APP_KEY`, `PUSHER_APP_SECRET`, `PUSHER_APP_CLUSTER`
- Used for real-time dashboards and updates

