## Domain Model

Primary entities (see `app/Models` and database migrations):

- User, Admin, Role
- Property, Address, Amenity, Image
- Investment, PropertyShare, PropertyOffer, OfferLock, OfferReply, InvestorReview
- Fund, Deposit, Transaction, MoneyTransfer
- Payout, PayoutMethod, Gateway
- Referral, ReferralBonus, Rank
- Kyc, UserKyc, UserLogin, UserSocial
- Content, ContentDetails, Page, PageDetail, ManageMenu, ManageTime, Language
- Blog, BlogCategory, BlogDetails, Subscriber
- NotificationTemplate, InAppNotification, FireBaseToken, FileStorage, MaintenanceMode

Example: Property relationships
- `Property` belongsTo `Address`
- `Property` morphMany `Image`
- `Property` hasMany `Investment`
- `Property` hasMany `InvestorReview`

Refer to database/migrations for full schema and constraints.
