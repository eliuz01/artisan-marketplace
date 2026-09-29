
# Design & Architecture Assets
Welcome to the design documentation for the **Artisan Marketplace** platform. This folder contains the visual architecture, user flows, database design, and interactive design links for our web application.
---
## 🔗 Key Design Links
### Figma Wireframes & Design Assets: 
* **Figma Interactive Prototype:** [Insert Blessing's Figma Link Here]
* 
* **Target Platforms:** Web & Mobile Responsive Web App (MVP)
---

## Entity Relationship Diagram (ERD)
The database structure powering the Supabase backend.
![Architecture Diagram](screenshots/architecture-diagram.png)

### Main Database Entities: 
1. **`users`**: Handles authentication and account roles (`customer`, `artisan`, `admin`).
2. **`artisan_profiles`**: Stores business bios, location categories, portfolio URLs, and verification status.
3. **`categories`**: Organizes service categories (Tailoring, Plumbing, Hairdressing, Photography, Electrical)[cite: 3].
4. **`reviews`**: Stores ratings (1–5 stars) and feedback attached to artisan listings[cite: 3].

---
## 📱 User Flows & Core Screens
The prototype covers two main user journeys

### 1. Customer Journey
1. **Landing Page:** Search bar & service category quick filters[cite: 3].
2. **Location Search:** Filter artisans based on city and local neighborhood area.
3. **Artisan Profile:** View artisan portfolio, ratings/reviews, and pricing.
4. **Contact Action:** In-app messaging or direct WhatsApp/Phone call trigger.

### 2. Artisan Journey
1. **Sign Up / Onboarding:** Multi-step form to collect business details, location, and photos.
2. **Profile Creation:** Instant publishing of the searchable artisan listing.
---