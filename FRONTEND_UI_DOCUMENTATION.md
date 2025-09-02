# ChainCity Frontend & UI Documentation

## Overview
ChainCity features a responsive, modern UI built with Bootstrap 5 and enhanced with custom JavaScript. The platform offers two distinct themes (Light and Green) with full mobile responsiveness.

## Technology Stack

### Core Technologies
- **CSS Framework**: Bootstrap 5.2.3
- **JavaScript**: Vanilla JS with minimal Vue.js
- **Build Tool**: Vite 4.0
- **CSS Preprocessor**: SASS
- **Icons**: FontAwesome 5, Custom SVG icons
- **Charts**: Chart.js for analytics
- **Animations**: AOS (Animate On Scroll)
- **Image Processing**: Lazy loading, WebP support

### Frontend Architecture
```
resources/
├── js/
│   ├── app.js           # Main application JS
│   ├── bootstrap.js      # Bootstrap configuration
│   └── components/       # Vue components
├── sass/
│   ├── app.scss         # Main SASS file
│   └── _variables.scss  # SASS variables
└── views/
    ├── layouts/         # Layout templates
    ├── admin/           # Admin panel views
    └── themes/          # Frontend themes
        ├── light/       # Light theme
        └── green/       # Green theme
```

---

## Theme System

### Available Themes

#### 1. Light Theme
- **Color Scheme**: Clean white background with blue accents
- **Typography**: Modern sans-serif fonts
- **Layout**: Minimalist design with focus on content
- **Best For**: Professional, corporate appearance

#### 2. Green Theme
- **Color Scheme**: Green primary colors with nature-inspired palette
- **Typography**: Friendly, readable fonts
- **Layout**: Warm, inviting design
- **Best For**: Eco-friendly, sustainable investment focus

### Theme Structure
```
themes/{theme_name}/
├── layouts/
│   ├── master.blade.php      # Main layout
│   ├── header.blade.php      # Header component
│   ├── footer.blade.php      # Footer component
│   └── sidebar.blade.php     # Sidebar navigation
├── sections/
│   ├── home/                 # Homepage sections
│   ├── property/             # Property pages
│   ├── user/                 # User dashboard
│   └── auth/                 # Authentication pages
├── partials/
│   ├── modal.blade.php       # Modal templates
│   ├── card.blade.php        # Card components
│   └── form.blade.php        # Form elements
└── assets/
    ├── css/
    ├── js/
    └── images/
```

---

## Page Components

### 1. Homepage

#### Hero Section
```html
<!-- Hero Banner with Investment CTA -->
<section class="hero-section">
    <div class="hero-content">
        <h1>Invest in Premium Real Estate</h1>
        <p>Start with as little as $1000</p>
        <button class="btn-primary">Get Started</button>
    </div>
    <div class="hero-stats">
        <div class="stat-item">
            <span class="stat-value">$10M+</span>
            <span class="stat-label">Total Invested</span>
        </div>
    </div>
</section>
```

**Features:**
- Animated statistics counters
- Parallax scrolling effect
- Video background option
- Responsive image slider

#### Property Showcase
```html
<!-- Featured Properties Grid -->
<section class="property-showcase">
    <div class="property-grid">
        <div class="property-card">
            <img src="property.jpg" class="property-image">
            <div class="property-details">
                <h3>Luxury Apartment</h3>
                <div class="investment-range">$1,000 - $50,000</div>
                <div class="roi-badge">12.5% ROI</div>
                <div class="progress-bar">
                    <div class="progress-fill" style="width: 65%"></div>
                </div>
            </div>
        </div>
    </div>
</section>
```

**Components:**
- Property cards with hover effects
- Investment progress bars
- ROI badges
- Quick invest buttons
- Favorite/bookmark functionality

#### Features Section
- Icon-based feature display
- Animated on scroll
- Responsive grid layout
- Interactive tooltips

### 2. Property Listing Page

#### Filter Sidebar
```html
<div class="filter-sidebar">
    <!-- Price Range Slider -->
    <div class="filter-group">
        <label>Investment Range</label>
        <input type="range" class="range-slider" 
               min="0" max="100000" step="1000">
        <div class="range-values">
            <span class="min-value">$0</span>
            <span class="max-value">$100,000</span>
        </div>
    </div>
    
    <!-- Property Type -->
    <div class="filter-group">
        <label>Property Type</label>
        <select class="form-select">
            <option>All Types</option>
            <option>Residential</option>
            <option>Commercial</option>
        </select>
    </div>
    
    <!-- Amenities -->
    <div class="filter-group">
        <label>Amenities</label>
        <div class="checkbox-group">
            <label><input type="checkbox"> Swimming Pool</label>
            <label><input type="checkbox"> Gym</label>
            <label><input type="checkbox"> Parking</label>
        </div>
    </div>
</div>
```

**Features:**
- Real-time filtering
- Price range slider
- Multi-select amenities
- Location-based search
- Sort options (price, ROI, popularity)

#### Property Grid/List View
- Toggle between grid and list layouts
- Lazy loading for images
- Infinite scroll pagination
- Quick view modal
- Compare properties feature

### 3. Property Detail Page

#### Image Gallery
```javascript
// Lightbox Gallery Implementation
class PropertyGallery {
    constructor(images) {
        this.images = images;
        this.currentIndex = 0;
    }
    
    init() {
        // Initialize lightbox
        // Add swipe gestures for mobile
        // Implement zoom functionality
    }
}
```

**Features:**
- Lightbox image viewer
- Thumbnail navigation
- Touch/swipe support
- Zoom functionality
- 360° virtual tour integration

#### Investment Calculator
```html
<div class="investment-calculator">
    <h3>Calculate Your Returns</h3>
    <input type="number" id="investment-amount" 
           placeholder="Enter amount">
    <div class="calculation-results">
        <div class="result-item">
            <span>Monthly Return:</span>
            <span class="value">$0.00</span>
        </div>
        <div class="result-item">
            <span>Annual Return:</span>
            <span class="value">$0.00</span>
        </div>
        <div class="result-item">
            <span>Total ROI:</span>
            <span class="value">0%</span>
        </div>
    </div>
</div>
```

**JavaScript:**
```javascript
function calculateReturns(amount, roi, period) {
    const monthlyReturn = (amount * roi / 100) / 12;
    const annualReturn = amount * roi / 100;
    const totalReturn = amount * roi / 100 * (period / 12);
    
    return {
        monthly: monthlyReturn,
        annual: annualReturn,
        total: totalReturn
    };
}
```

#### Property Information Tabs
- Overview
- Amenities
- Location & Map
- Documents
- Investment Terms
- FAQ
- Reviews

### 4. User Dashboard

#### Dashboard Layout
```html
<div class="dashboard-container">
    <!-- Sidebar Navigation -->
    <aside class="dashboard-sidebar">
        <nav class="sidebar-nav">
            <a href="#" class="nav-item active">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
            <a href="#" class="nav-item">
                <i class="fas fa-chart-line"></i>
                <span>Investments</span>
            </a>
            <!-- More menu items -->
        </nav>
    </aside>
    
    <!-- Main Content -->
    <main class="dashboard-main">
        <!-- Content here -->
    </main>
</div>
```

#### Dashboard Widgets
```html
<!-- Statistics Cards -->
<div class="stat-cards">
    <div class="stat-card">
        <div class="stat-icon">
            <i class="fas fa-wallet"></i>
        </div>
        <div class="stat-content">
            <h4>Available Balance</h4>
            <p class="stat-value">$10,000</p>
            <span class="stat-change positive">+5.2%</span>
        </div>
    </div>
</div>

<!-- Investment Chart -->
<canvas id="investmentChart"></canvas>
```

**Chart Implementation:**
```javascript
const ctx = document.getElementById('investmentChart').getContext('2d');
const chart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
        datasets: [{
            label: 'Portfolio Value',
            data: [10000, 10500, 11000, 10800, 11500],
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false
    }
});
```

#### Portfolio Management
- Investment overview table
- Performance charts
- Return history
- Active investments grid
- Transaction history

### 5. Payment Interface

#### Deposit Form
```html
<form class="deposit-form">
    <div class="payment-methods">
        <label class="payment-method">
            <input type="radio" name="gateway" value="stripe">
            <div class="method-content">
                <img src="stripe-logo.png" alt="Stripe">
                <span>Credit/Debit Card</span>
            </div>
        </label>
        <!-- More payment methods -->
    </div>
    
    <div class="amount-input">
        <label>Amount</label>
        <div class="input-group">
            <span class="input-group-text">$</span>
            <input type="number" class="form-control" 
                   placeholder="0.00">
        </div>
    </div>
    
    <button type="submit" class="btn btn-primary">
        Proceed to Payment
    </button>
</form>
```

#### Payment Gateway Integration
```javascript
// Stripe Integration Example
const stripe = Stripe('pk_test_...');

async function handlePayment(amount) {
    const response = await fetch('/api/create-payment-intent', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({amount})
    });
    
    const {clientSecret} = await response.json();
    
    const result = await stripe.confirmCardPayment(clientSecret, {
        payment_method: {
            card: cardElement,
            billing_details: {
                name: 'Customer Name'
            }
        }
    });
}
```

### 6. Admin Panel

#### Admin Dashboard
```html
<div class="admin-dashboard">
    <!-- Summary Cards -->
    <div class="summary-cards">
        <div class="summary-card">
            <h3>Total Users</h3>
            <p class="value">1,234</p>
            <span class="trend up">↑ 12%</span>
        </div>
    </div>
    
    <!-- Charts Section -->
    <div class="charts-row">
        <div class="chart-container">
            <canvas id="revenueChart"></canvas>
        </div>
        <div class="chart-container">
            <canvas id="userGrowthChart"></canvas>
        </div>
    </div>
    
    <!-- Recent Activities -->
    <div class="recent-activities">
        <h3>Recent Activities</h3>
        <div class="activity-list">
            <!-- Activity items -->
        </div>
    </div>
</div>
```

#### Data Tables
```javascript
// DataTables Implementation
$(document).ready(function() {
    $('#usersTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/admin/users/data',
        columns: [
            {data: 'id'},
            {data: 'name'},
            {data: 'email'},
            {data: 'balance'},
            {data: 'status'},
            {data: 'actions', orderable: false}
        ],
        order: [[0, 'desc']]
    });
});
```

#### Form Builders
- Dynamic form generation
- Validation rules
- File upload handling
- Rich text editor (TinyMCE/CKEditor)

---

## UI Components Library

### 1. Buttons
```html
<!-- Primary Button -->
<button class="btn btn-primary">
    <i class="fas fa-check"></i> Submit
</button>

<!-- Gradient Button -->
<button class="btn btn-gradient">
    Invest Now
</button>

<!-- Loading Button -->
<button class="btn btn-primary loading">
    <span class="spinner-border spinner-border-sm"></span>
    Processing...
</button>
```

**Styles:**
```scss
.btn-gradient {
    background: linear-gradient(45deg, #667eea 0%, #764ba2 100%);
    color: white;
    border: none;
    
    &:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }
}
```

### 2. Cards
```html
<!-- Property Card -->
<div class="card property-card">
    <div class="card-image">
        <img src="property.jpg" alt="Property">
        <div class="card-overlay">
            <span class="badge">Featured</span>
        </div>
    </div>
    <div class="card-body">
        <h3 class="card-title">Property Title</h3>
        <p class="card-text">Description</p>
        <div class="card-footer">
            <span class="price">$50,000</span>
            <button class="btn-sm">View Details</button>
        </div>
    </div>
</div>
```

### 3. Modals
```html
<!-- Investment Modal -->
<div class="modal fade" id="investModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Make Investment</h5>
                <button type="button" class="btn-close" 
                        data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <!-- Investment form -->
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" 
                        data-bs-dismiss="modal">Cancel</button>
                <button class="btn btn-primary">Confirm</button>
            </div>
        </div>
    </div>
</div>
```

### 4. Forms
```html
<!-- Custom Input Group -->
<div class="form-group">
    <label class="form-label">Investment Amount</label>
    <div class="input-group">
        <span class="input-group-text">$</span>
        <input type="number" class="form-control" 
               placeholder="0.00">
        <span class="input-group-text">.00</span>
    </div>
    <small class="form-text">Minimum: $1,000</small>
</div>

<!-- Custom Select -->
<div class="form-group">
    <label>Property Type</label>
    <select class="form-select custom-select">
        <option>Choose...</option>
        <option>Residential</option>
        <option>Commercial</option>
    </select>
</div>
```

### 5. Alerts & Notifications
```html
<!-- Success Alert -->
<div class="alert alert-success alert-dismissible fade show">
    <i class="fas fa-check-circle"></i>
    <strong>Success!</strong> Your investment has been processed.
    <button type="button" class="btn-close" 
            data-bs-dismiss="alert"></button>
</div>

<!-- Toast Notification -->
<div class="toast-container position-fixed top-0 end-0 p-3">
    <div class="toast" role="alert">
        <div class="toast-header">
            <strong class="me-auto">Notification</strong>
            <button type="button" class="btn-close" 
                    data-bs-dismiss="toast"></button>
        </div>
        <div class="toast-body">
            New property available for investment!
        </div>
    </div>
</div>
```

**JavaScript:**
```javascript
// Show toast notification
function showToast(message, type = 'info') {
    const toast = new bootstrap.Toast(document.querySelector('.toast'));
    document.querySelector('.toast-body').textContent = message;
    toast.show();
}
```

---

## Responsive Design

### Breakpoints
```scss
// Bootstrap 5 breakpoints
$breakpoints: (
    xs: 0,
    sm: 576px,
    md: 768px,
    lg: 992px,
    xl: 1200px,
    xxl: 1400px
);
```

### Mobile Optimization

#### Touch Gestures
```javascript
// Swipe detection for mobile
let touchStartX = 0;
let touchEndX = 0;

element.addEventListener('touchstart', e => {
    touchStartX = e.changedTouches[0].screenX;
});

element.addEventListener('touchend', e => {
    touchEndX = e.changedTouches[0].screenX;
    handleSwipe();
});

function handleSwipe() {
    if (touchEndX < touchStartX) {
        // Swiped left
    }
    if (touchEndX > touchStartX) {
        // Swiped right
    }
}
```

#### Mobile Menu
```html
<!-- Mobile Navigation -->
<nav class="mobile-nav">
    <button class="menu-toggle" data-bs-toggle="offcanvas" 
            data-bs-target="#mobileMenu">
        <span class="hamburger"></span>
    </button>
    
    <div class="offcanvas offcanvas-start" id="mobileMenu">
        <div class="offcanvas-header">
            <h5>Menu</h5>
            <button type="button" class="btn-close" 
                    data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <!-- Menu items -->
        </div>
    </div>
</nav>
```

---

## Performance Optimization

### Image Optimization
```html
<!-- Lazy Loading -->
<img src="placeholder.jpg" 
     data-src="actual-image.jpg" 
     class="lazyload" 
     alt="Property">

<!-- WebP with fallback -->
<picture>
    <source srcset="image.webp" type="image/webp">
    <source srcset="image.jpg" type="image/jpeg">
    <img src="image.jpg" alt="Property">
</picture>
```

### JavaScript Optimization
```javascript
// Debounce function for search
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Usage
const searchInput = document.getElementById('search');
searchInput.addEventListener('input', 
    debounce(performSearch, 300)
);
```

### CSS Optimization
```scss
// Critical CSS
.above-the-fold {
    // Inline critical styles
}

// Async load non-critical CSS
<link rel="preload" href="styles.css" as="style" 
      onload="this.onload=null;this.rel='stylesheet'">
```

---

## Accessibility Features

### ARIA Labels
```html
<!-- Accessible form -->
<form role="form" aria-label="Investment form">
    <label for="amount">Investment Amount</label>
    <input type="number" id="amount" 
           aria-describedby="amount-help"
           aria-required="true">
    <small id="amount-help">Enter amount in USD</small>
</form>

<!-- Accessible navigation -->
<nav role="navigation" aria-label="Main navigation">
    <ul role="menubar">
        <li role="none">
            <a role="menuitem" href="#">Home</a>
        </li>
    </ul>
</nav>
```

### Keyboard Navigation
```javascript
// Keyboard navigation support
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        closeModal();
    }
    if (e.key === 'Enter' && e.target.matches('.search-input')) {
        performSearch();
    }
});
```

---

## Browser Compatibility

### Supported Browsers
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile Safari (iOS 14+)
- Chrome Mobile (Android 10+)

### Polyfills
```html
<!-- IE11 Support (if needed) -->
<script src="https://polyfill.io/v3/polyfill.min.js"></script>
```

---

## Development Tools

### Build Process
```json
// package.json scripts
{
    "scripts": {
        "dev": "vite",
        "build": "vite build",
        "watch": "vite build --watch"
    }
}
```

### Vite Configuration
```javascript
// vite.config.js
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/sass/app.scss',
                'resources/js/app.js',
            ],
            refresh: true,
        }),
    ],
});
```

---

**Frontend Version**: 1.0  
**Last Updated**: January 2025