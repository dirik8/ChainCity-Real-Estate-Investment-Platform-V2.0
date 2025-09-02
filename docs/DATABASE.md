## Database Overview

Key tables (see `database/migrations` for full schema):

- Users & Auth: `users`, `personal_access_tokens`, `user_logins`
- Admins & Roles: `admins`, `roles`, role-related permissions (see `config/role.php`, `config/permissionList.php`)
- Basic Settings: `basic_controls`, `file_storages`, `languages`, `maintenance_modes`
- Content/CMS: `pages`, `page_details`, `contents`, `content_details`, `blogs`, `blog_categories`, `blog_details`, `subscribers`
- Notifications: `fire_base_tokens`, `in_app_notifications`, `notification_templates`
- Finance: `transactions`, `funds`, `deposits`, `payouts`, `gateways`, `payout_methods`
- KYC: `kycs`, `user_kycs`
- Property & Investment: `properties`, `addresses`, `amenities`, `images`, `investments`, `property_shares`, `property_offers`, `offer_locks`, `offer_replies`
- Reviews: `investor_reviews` (plus stats columns on `properties`)
- Referral & Rank: `referrals`, `ranks`, `rankings`, `referral_bonuses`
- Support: `support_tickets`, `support_ticket_messages`, `support_ticket_attachments`

Seeders initialize admin user, basic control, storage, languages, pages, menus, gateways, templates, etc.

