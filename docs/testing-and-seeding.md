## Testing & Seeding

### Tests
- PHPUnit configured (`phpunit.xml`), example tests in `tests/Feature` and `tests/Unit`
- Run tests: `phpunit` or `php artisan test`

### Seeders
- Seeders in `database/seeders`: AdminSeeder, BasicControlSeeder, GatewaySeeder, LanguageSeeder, FileStorageSeeder, ManageMenuSeeder, MaintenanceSeeder, NotificationSeeder, Content & Page seeders, RandomSeeder
- Factories available for User, Property, Investment
- Run: `php artisan db:seed` (after migrations)
