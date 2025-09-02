## Architecture

### Layers & Directories
- `app/Models`: Eloquent models (User, Property, Investment, PropertyShare, PropertyOffer, OfferLock, OfferReply, Transaction, Deposit, Payout, Kyc, Rank, Referral, Blog, etc.)
- `app/Http/Controllers`:
  - `Admin`: admin features (users, roles, investments, payments/payouts, languages, templates, plugins, storage, CMS)
  - `Api`: REST API endpoints mirroring user features for mobile/SPA
  - `User`: authenticated user features (wallet, investments, market, KYC, profile, tickets)
  - `Auth`, `Frontend`, `TwoFaSecurity`, `InAppNotification`
- `app/Helpers/helpers.php`: application-wide helpers (themes, menus, formatting, files, content sections, basic control cache)
- `config/*`: feature toggles and provider configs (payments, firebase, pusher, sms, mail, languages, roles, permissions)
- `routes/{web,admin,api}.php`: HTTP entry points
- `resources/views`: Blade views with theme support under `resources/views/themes/{theme}`
- `database/{migrations,seeders}`: schema and initial content (admin user, basic control, languages, menus, pages, gateways)

### Cross-Cutting Concerns
- **Auth**: Laravel authentication, Sanctum for API tokens
- **Validation**: Request validation per controller actions
- **Cache**: Config and content caches in helpers; route/config caches recommended in prod
- **Jobs & Scheduling**: Queue workers and scheduled tasks; admin routes exist to trigger `queue:work` and `schedule:run` in controlled environments
- **Notifications**: In-app notification entities and templates; push via Firebase; realtime via Pusher
- **Security**: reCAPTCHA support, HTML purification, 2FA, KYC gating middleware, maintenance mode

### Routing & Middleware
- Global maintenance guard wraps most web routes (`maintenanceMode`)
- User routes under `/user/*` apply `auth`, `userCheck`, and `kyc` where required
- Admin routes under configurable prefix (default `/admin`) use `auth:admin` and permission middleware
- API routes use `auth:sanctum` where required

