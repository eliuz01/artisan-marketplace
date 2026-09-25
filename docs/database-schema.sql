-- Enable UUID extension for secure, unique IDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. USERS TABLE (Handles Authentication & Profiles for Customers & Artisans)
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(20) NOT NULL CHECK (role IN ('customer', 'artisan', 'admin')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. CATEGORIES TABLE (Organizes Artisans: Tailoring, Plumbing, Photography, etc.)
CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    icon_name VARCHAR(50) -- Useful for frontend icon rendering
);

-- 3. ARTISAN_PROFILES TABLE (Onboarding data & Business details)
CREATE TABLE artisan_profiles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID UNIQUE REFERENCES users(id) ON DELETE CASCADE,
    business_name VARCHAR(255) NOT NULL,
    category_id UUID REFERENCES categories(id) ON DELETE SET NULL,
    short_bio TEXT,
    location_city VARCHAR(100) NOT NULL,
    location_area VARCHAR(100) NOT NULL, -- Neighborhood-level search
    portfolio_image_urls TEXT[], -- Array of image links for work samples
    is_verified BOOLEAN DEFAULT FALSE, -- Trust Tier Flag
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 4. REVIEWS TABLE (Ratings and Feedback for Artisans)
CREATE TABLE reviews (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    artisan_id UUID REFERENCES artisan_profiles(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES users(id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 5. INITIAL SEED DATA FOR CATEGORIES
INSERT INTO categories (name, description) VALUES
('Tailoring', 'Custom clothes, alterations, and fashion design'),
('Plumbing', 'Pipe repairs, drainage, and bathroom fittings'),
('Hairdressing', 'Barbing, hair styling, braids, and beauty treatments'),
('Photography', 'Event coverage, studio portraits, and video shoots'),
('Electrical Services', 'House wiring, appliance installation, and repairs');
