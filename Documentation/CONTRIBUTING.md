# Contributing Guide

Thank you for your interest in contributing to the Real Estate Investment Platform! This guide will help you understand how to contribute effectively to the project.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [Getting Started](#getting-started)
3. [Development Setup](#development-setup)
4. [Contribution Workflow](#contribution-workflow)
5. [Coding Standards](#coding-standards)
6. [Testing Guidelines](#testing-guidelines)
7. [Documentation](#documentation)
8. [Pull Request Process](#pull-request-process)
9. [Issue Reporting](#issue-reporting)
10. [Community](#community)

## Code of Conduct

### Our Pledge

We are committed to making participation in our project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

Examples of behavior that contributes to creating a positive environment include:
- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

### Enforcement

Project maintainers are responsible for clarifying the standards of acceptable behavior and are expected to take appropriate and fair corrective action in response to any instances of unacceptable behavior.

## Getting Started

### Prerequisites

Before contributing, ensure you have:
- PHP 8.1 or higher
- Composer
- Node.js 16.x or higher
- MySQL or PostgreSQL
- Git
- A GitHub account

### Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
```bash
git clone https://github.com/your-username/real-estate-platform.git
cd real-estate-platform
```

3. Add the upstream repository:
```bash
git remote add upstream https://github.com/original-repo/real-estate-platform.git
```

## Development Setup

### Local Environment Setup

1. **Install Dependencies**
```bash
# Install PHP dependencies
composer install

# Install Node.js dependencies
npm install
```

2. **Environment Configuration**
```bash
# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate

# Configure your database settings in .env
```

3. **Database Setup**
```bash
# Run migrations
php artisan migrate

# Seed database with test data
php artisan db:seed
```

4. **Build Assets**
```bash
# Build frontend assets
npm run dev

# Or for production
npm run build
```

5. **Start Development Server**
```bash
# Start Laravel development server
php artisan serve

# Start asset watcher (in another terminal)
npm run watch
```

### Development Tools

#### Recommended IDE Setup
- **PhpStorm** or **VS Code** with PHP extensions
- **Laravel Idea** plugin (for PhpStorm)
- **PHP Intelephense** extension (for VS Code)

#### Code Quality Tools
```bash
# Install PHP CS Fixer
composer global require friendsofphp/php-cs-fixer

# Install PHPStan
composer require --dev phpstan/phpstan

# Install Laravel Pint
composer require laravel/pint --dev
```

## Contribution Workflow

### Branch Strategy

We use a Git flow-based branching strategy:

- **main**: Production-ready code
- **develop**: Integration branch for features
- **feature/**: New features (`feature/user-authentication`)
- **bugfix/**: Bug fixes (`bugfix/payment-gateway-error`)
- **hotfix/**: Critical production fixes (`hotfix/security-patch`)

### Creating a Feature Branch

```bash
# Update your local repository
git checkout develop
git pull upstream develop

# Create a new feature branch
git checkout -b feature/your-feature-name

# Make your changes
# ... code changes ...

# Commit your changes
git add .
git commit -m "Add user authentication feature"

# Push to your fork
git push origin feature/your-feature-name
```

### Keeping Your Fork Updated

```bash
# Fetch upstream changes
git fetch upstream

# Update develop branch
git checkout develop
git merge upstream/develop

# Update your feature branch
git checkout feature/your-feature-name
git merge develop
```

## Coding Standards

### PHP Standards

We follow PSR-12 coding standards with some Laravel-specific conventions:

#### Code Style
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class ExampleController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function handle(Request $request): JsonResponse
    {
        $data = $this->processRequest($request);
        
        return response()->json([
            'status' => 'success',
            'data' => $data
        ]);
    }
    
    /**
     * Process the incoming request.
     */
    private function processRequest(Request $request): array
    {
        // Implementation here
        return [];
    }
}
```

#### Naming Conventions
- **Classes**: PascalCase (`UserController`, `PropertyModel`)
- **Methods**: camelCase (`getUserData`, `processPayment`)
- **Variables**: camelCase (`$userData`, `$paymentAmount`)
- **Constants**: UPPER_SNAKE_CASE (`MAX_UPLOAD_SIZE`)
- **Database tables**: snake_case (`user_investments`)
- **Database columns**: snake_case (`created_at`, `user_id`)

#### Laravel Conventions
- **Controllers**: Singular name + Controller (`UserController`)
- **Models**: Singular name (`User`, `Property`)
- **Migrations**: Descriptive name (`create_users_table`)
- **Routes**: Use kebab-case (`/user-profile`, `/investment-history`)

### JavaScript Standards

We use ES6+ standards with consistent formatting:

```javascript
// Use const/let instead of var
const apiEndpoint = '/api/users';
let userData = null;

// Use arrow functions for callbacks
const users = data.map(user => ({
    id: user.id,
    name: user.full_name
}));

// Use template literals
const message = `Welcome, ${user.name}!`;

// Use async/await for promises
async function fetchUserData(userId) {
    try {
        const response = await fetch(`/api/users/${userId}`);
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Error fetching user data:', error);
        throw error;
    }
}
```

### CSS/SCSS Standards

```scss
// Use BEM methodology
.user-profile {
    padding: 20px;
    
    &__header {
        margin-bottom: 15px;
    }
    
    &__content {
        line-height: 1.5;
    }
    
    &--highlighted {
        background-color: #f0f8ff;
    }
}

// Use meaningful class names
.btn-primary {
    background-color: var(--primary-color);
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    
    &:hover {
        background-color: var(--primary-color-dark);
    }
}
```

## Testing Guidelines

### Testing Strategy

We use a comprehensive testing approach:

1. **Unit Tests**: Test individual methods and classes
2. **Feature Tests**: Test complete user workflows
3. **Integration Tests**: Test component interactions
4. **Browser Tests**: Test UI functionality

### Writing Tests

#### Unit Test Example
```php
<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Services\InvestmentCalculator;

class InvestmentCalculatorTest extends TestCase
{
    public function test_calculates_monthly_return_correctly()
    {
        $calculator = new InvestmentCalculator();
        
        $result = $calculator->calculateMonthlyReturn(
            principal: 10000,
            annualRate: 8.5,
            months: 12
        );
        
        $this->assertEquals(70.83, $result, '', 0.01);
    }
    
    public function test_throws_exception_for_negative_principal()
    {
        $calculator = new InvestmentCalculator();
        
        $this->expectException(\InvalidArgumentException::class);
        
        $calculator->calculateMonthlyReturn(
            principal: -1000,
            annualRate: 8.5,
            months: 12
        );
    }
}
```

#### Feature Test Example
```php
<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Models\Property;
use Illuminate\Foundation\Testing\RefreshDatabase;

class PropertyInvestmentTest extends TestCase
{
    use RefreshDatabase;
    
    public function test_user_can_invest_in_property()
    {
        $user = User::factory()->create(['balance' => 10000]);
        $property = Property::factory()->create([
            'minimum_amount' => 1000,
            'maximum_amount' => 5000
        ]);
        
        $response = $this->actingAs($user)
            ->postJson("/api/invest/property/{$property->id}", [
                'amount' => 2000
            ]);
        
        $response->assertStatus(200)
            ->assertJson([
                'status' => 'success',
                'data' => [
                    'investment' => [
                        'amount' => 2000
                    ]
                ]
            ]);
        
        $this->assertDatabaseHas('investments', [
            'user_id' => $user->id,
            'property_id' => $property->id,
            'amount' => 2000
        ]);
    }
}
```

### Running Tests

```bash
# Run all tests
php artisan test

# Run specific test suite
php artisan test --testsuite=Unit
php artisan test --testsuite=Feature

# Run tests with coverage
php artisan test --coverage

# Run specific test file
php artisan test tests/Feature/PropertyInvestmentTest.php

# Run specific test method
php artisan test --filter test_user_can_invest_in_property
```

### Test Database

Use a separate test database:

```env
# .env.testing
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=real_estate_platform_test
DB_USERNAME=root
DB_PASSWORD=
```

## Documentation

### Code Documentation

#### PHPDoc Standards
```php
<?php

/**
 * Calculate investment returns based on property performance.
 *
 * @param float $principal The initial investment amount
 * @param float $annualRate The annual return rate as percentage
 * @param int $months The investment period in months
 * @return float The calculated monthly return
 * 
 * @throws \InvalidArgumentException When principal is negative
 * @throws \InvalidArgumentException When annual rate is invalid
 */
public function calculateMonthlyReturn(float $principal, float $annualRate, int $months): float
{
    if ($principal < 0) {
        throw new \InvalidArgumentException('Principal amount cannot be negative');
    }
    
    if ($annualRate < 0 || $annualRate > 100) {
        throw new \InvalidArgumentException('Annual rate must be between 0 and 100');
    }
    
    $monthlyRate = $annualRate / 100 / 12;
    return $principal * $monthlyRate;
}
```

#### API Documentation
Use OpenAPI/Swagger annotations:

```php
<?php

/**
 * @OA\Post(
 *     path="/api/invest/property/{id}",
 *     summary="Invest in a property",
 *     tags={"Investments"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         @OA\Schema(type="integer"),
 *         description="Property ID"
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             @OA\Property(property="amount", type="number", example=5000),
 *             @OA\Property(property="payment_method", type="string", example="balance")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Investment successful",
 *         @OA\JsonContent(
 *             @OA\Property(property="status", type="string", example="success"),
 *             @OA\Property(property="data", type="object")
 *         )
 *     )
 * )
 */
public function investProperty(Request $request, $id)
{
    // Implementation
}
```

### README Updates

When adding new features, update the relevant documentation:
- Main README.md for overview changes
- Feature-specific documentation files
- API documentation for new endpoints
- Installation instructions for new dependencies

## Pull Request Process

### Before Submitting

1. **Code Quality Checks**
```bash
# Run code style fixer
./vendor/bin/pint

# Run static analysis
./vendor/bin/phpstan analyse

# Run tests
php artisan test
```

2. **Documentation Updates**
- Update relevant documentation files
- Add inline code comments
- Update API documentation if applicable

3. **Commit Message Standards**
Use conventional commit messages:

```
feat: add user investment portfolio dashboard
fix: resolve payment gateway timeout issue
docs: update API documentation for property endpoints
test: add unit tests for investment calculator
refactor: optimize database queries in property service
style: fix code formatting in user controller
chore: update dependencies and security patches
```

### Pull Request Template

When creating a pull request, use this template:

```markdown
## Description
Brief description of the changes made.

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update

## Changes Made
- List specific changes made
- Include any new dependencies
- Mention any breaking changes

## Testing
- [ ] Unit tests pass
- [ ] Feature tests pass
- [ ] Manual testing completed
- [ ] Browser testing completed (if UI changes)

## Screenshots (if applicable)
Include screenshots for UI changes.

## Checklist
- [ ] Code follows project coding standards
- [ ] Self-review of code completed
- [ ] Code is commented, particularly in hard-to-understand areas
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] No new warnings or errors introduced
```

### Review Process

1. **Automated Checks**: CI/CD pipeline runs tests and code quality checks
2. **Peer Review**: At least one maintainer reviews the code
3. **Testing**: Changes are tested in a staging environment
4. **Approval**: Maintainer approves and merges the pull request

## Issue Reporting

### Bug Reports

Use the bug report template:

```markdown
## Bug Description
A clear and concise description of the bug.

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll down to '...'
4. See error

## Expected Behavior
A clear description of what you expected to happen.

## Actual Behavior
A clear description of what actually happened.

## Screenshots
If applicable, add screenshots to help explain your problem.

## Environment
- OS: [e.g., Windows 10, macOS Big Sur]
- Browser: [e.g., Chrome 91, Firefox 89]
- PHP Version: [e.g., 8.1.2]
- Laravel Version: [e.g., 11.0]

## Additional Context
Add any other context about the problem here.
```

### Feature Requests

Use the feature request template:

```markdown
## Feature Description
A clear and concise description of the feature you'd like to see.

## Problem Statement
Describe the problem this feature would solve.

## Proposed Solution
Describe the solution you'd like to see implemented.

## Alternatives Considered
Describe any alternative solutions you've considered.

## Additional Context
Add any other context, mockups, or examples about the feature request.
```

## Community

### Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: General questions and community discussions
- **Discord/Slack**: Real-time chat with other contributors
- **Email**: security@yourplatform.com for security issues

### Getting Help

If you need help with contributing:

1. Check existing documentation
2. Search through GitHub issues
3. Ask in GitHub Discussions
4. Join our community chat

### Recognition

Contributors are recognized in:
- CONTRIBUTORS.md file
- Release notes
- Project website (if applicable)
- Annual contributor appreciation posts

---

## Thank You!

Thank you for contributing to the Real Estate Investment Platform! Your contributions help make this project better for everyone. We appreciate your time and effort in improving the platform.

Remember:
- Start small with your first contribution
- Ask questions if you're unsure
- Be patient with the review process
- Help others in the community
- Have fun coding!

Happy contributing! 🚀