# 🛒 IT Nayeem E-Commerce Platform (Ecommerce 5)

[![Laravel](https://img.shields.io/badge/Framework-Laravel-red?style=for-the-badge&logo=laravel)](https://laravel.com)
[![PHP](https://img.shields.io/badge/PHP-8.x-777bb4?style=for-the-badge&logo=php)](https://php.net)
[![MySQL/MariaDB](https://img.shields.io/badge/Database-MySQL%20%2F%20MariaDB-4479A1?style=for-the-badge&logo=mysql)](https://mariadb.org)
[![License](https://img.shields.io/badge/License-Proprietary-blue?style=for-the-badge)](https://itnayeem.com.bd/)
[![Website](https://img.shields.io/badge/Website-itnayeem.com.bd-green?style=for-the-badge)](https://itnayeem.com.bd/)

A robust, enterprise-grade, feature-rich modern E-Commerce and multi-vendor marketplace platform developed and maintained by **[IT Nayeem](https://itnayeem.com.bd/)**. Designed with high performance, sleek UI/UX, responsive mobile layouts, secure payment gateways, and comprehensive administrative controls for scaling online retail businesses.

---

## 🏢 About IT Nayeem

**IT Nayeem** is a premier software development, digital solutions, and IT consultancy company based in Bangladesh. We build high-performance web applications, bespoke multi-vendor e-commerce marketplaces, customized ERPs, and cloud solutions tailored for businesses aiming for rapid growth and reliability.

* 🌐 **Official Website:** [https://itnayeem.com.bd/](https://itnayeem.com.bd/)
* 📞 **Helpline & Contact:** `+8801511777744`
* ✉️ **Support Email:** [support@itnayeem.com.bd](mailto:support@itnayeem.com.bd)

---

## 🚀 Key Features & Capabilities

* **🛍️ Comprehensive Product Catalog:**
  * Support for Physical, Digital, and License products.
  * Multi-level Categories, Sub-categories, and Child Categories.
  * Product Variants, Color Attributes, Size options, and dynamic SKU inventory tracking.
  * Flash Deals, Featured Items, Trending Collections, and Discount countdown timers.

* **💳 Smooth Checkout & Payment Integrations:**
  * Fast Multi-step and Guest Checkout options.
  * Integrated local Bangladeshi payment gateways (bKash, Nagad, Rocket) and manual bank transfers / Cash on Delivery (COD).
  * International payment gateways support (PayPal, Stripe, Mollie, Razorpay, etc.).
  * Multi-currency switcher with real-time currency conversion.

* **🚚 Order Management & Fulfillment:**
  * Real-time order tracking with customer SMS/Email alerts.
  * Automated shipping calculations and packaging slip / PDF invoice generation.
  * Customer return, refund, and dispute handling workflows.

* **👥 Multi-Vendor & Seller Ecosystem:**
  * Independent seller portal with customized store URLs.
  * Vendor commission tracking, earnings overview, and balance payout requests.
  * Vendor product submissions, customer-to-vendor direct inquiries, and store ratings.

* **🎨 Modern Responsive UI & Marketing Tools:**
  * Clean, mobile-first Blade templating with dynamic sliders and carousels.
  * Coupon management, affiliate referrals, blog section, and promotional popup banners.
  * Built-in SEO metadata management, sitemaps, and social share integrations.

* **🛡️ Security & Performance:**
  * CSRF protection, SQL injection prevention, and secure password hashing.
  * Deprecation handling and compatibility optimization for PHP 8.x environments.

---

## 🛠️ Technology Stack & Architecture

| Layer | Technologies |
| :--- | :--- |
| **Backend Framework** | Laravel (PHP 8.x compatible) |
| **Frontend Engine** | Blade Templating, Vanilla CSS, Bootstrap, jQuery, AJAX |
| **Database** | MariaDB 10.11+ / MySQL 8.0+ (`it_nayeem_db`) |
| **Server Support** | Apache, Nginx, PHP Built-in Server with custom router (`server.php`) |
| **Asset Pipeline** | Optimized CSS, JS, and CDN libraries |

---

## 🔐 Admin Panel Access & Credentials

The administrative dashboard provides full oversight over sales, products, orders, customers, financial reports, payment gateways, and system configurations.

* **Admin Panel URL:** `/admin` (or `/admin/login`)
  * Local Dev: `http://127.0.0.1:8005/admin`
* **Admin Email:** `support@itnayeem.com.bd`
* **Admin Password:** `12345678`

> ⚠️ **Security Notice:** Always change the default admin credentials immediately after deploying to a live production environment.

---

## ⚙️ Installation & Setup Guide

### 1. System Requirements
* **PHP:** `>= 7.4` or `8.0` - `8.5` (Required extensions: `pdo_mysql`, `mbstring`, `openssl`, `tokenizer`, `xml`, `ctype`, `json`, `curl`, `gd`)
* **Database:** MySQL `>= 5.7` or MariaDB `>= 10.5`
* **Web Server:** Apache, Nginx, or PHP CLI Server

### 2. Clone the Repository
```bash
git clone https://github.com/itnayeem/itnayeem-ecommerce_5.git
cd itnayeem-ecommerce_5
```

### 3. Database Setup
1. Create a database named `it_nayeem_db` in your MySQL / MariaDB server:
   ```sql
   CREATE DATABASE it_nayeem_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
2. Import the provided SQL database dump (`it_nayeem_db.sql`):
   ```bash
   mysql -u root -p it_nayeem_db < it_nayeem_db.sql
   ```

### 4. Environment Configuration
Verify or edit `project/.env` with your local database credentials:
```env
APP_NAME=Laravel
APP_ENV=local
APP_KEY=base64:Jv+WvmI5e+wo4xbMQdLnmI3zjlFR6pFUY2Gv42ox8W8=
APP_DEBUG=false
APP_URL=http://127.0.0.1:8005

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=it_nayeem_db
DB_USERNAME=your_database_username
DB_PASSWORD=your_database_password
```

### 5. Running the Application Locally
Launch the application using PHP's built-in server with the provided root router:
```bash
php -d display_errors=0 -S 0.0.0.0:8005 server.php
```

Or using Laravel Artisan from the `project` directory:
```bash
cd project
php artisan serve --port=8005
```

Access the application in your browser:
* **Frontend:** [http://127.0.0.1:8005](http://127.0.0.1:8005)
* **Admin Panel:** [http://127.0.0.1:8005/admin](http://127.0.0.1:8005/admin)

---

## 📞 Customer Support & Inquiries

For customer support, technical assistance, or custom software requirements, contact **IT Nayeem**:

* 🌐 **Website:** [https://itnayeem.com.bd/](https://itnayeem.com.bd/)
* 📞 **Phone:** `+8801511777744`
* ✉️ **Support Email:** [support@itnayeem.com.bd](mailto:support@itnayeem.com.bd)

---

<div align="center">
  <p>© 2026 <strong>IT NAYEEM</strong>. All rights reserved. | Website Designed & Developed by <a href="https://itnayeem.com.bd/">IT Nayeem</a></p>
</div>
