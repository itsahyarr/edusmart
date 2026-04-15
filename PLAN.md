## Goal

Implement the EduSmart Landing Page MVP based on the provided Product Requirements Document (`PRD.md`). The implementation must strictly follow the AIDA framework, focus on high conversion, and use the specified SvelteKit stack.

---

## Pre-requisites

- Ensure you have Node.js installed (LTS recommended).
- Familiarity with SvelteKit, Tailwind CSS, and component-based architecture.
- Read `PRD.md` to understand the business logic, target audience, and AIDA structure.

---

## Step-by-Step Execution Plan

### Step 1: Project Initialization & Configuration

1. **Bootstrap SvelteKit Project:**
   - Create a new SvelteKit project in this directory (if not already done) or a designated `src` folder.
   - Use Skeleton project, TypeScript (optional but recommended for robustness), and ESLint + Prettier.
2. **Install Dependencies:**
   - Install Tailwind CSS, PostCSS, and Autoprefixer according to SvelteKit's Tailwind integration guide.
   - Install an icon library matching the PRD, e.g., `lucide-svelte` (which is a modern fork of Feather Icons) or `svelte-feather-icons`.
3. **Configure Tailwind CSS & Fonts:**
   - Update `tailwind.config.js` with the brand palette:
     - `trust-blue`: `#1A56DB`
     - `energy-orange`: `#F97316`
   - Import Google Fonts `Poppins` (for headings) and `Inter` (for body text) into the global CSS or `app.html`.
   - Configure Tailwind to use these fonts (e.g., `font-heading: ['Poppins', 'sans-serif']`, `font-sans: ['Inter', 'sans-serif']`).
4. **Setup Global Styles:**
   - Define smooth scrolling in global CSS (`html { scroll-behavior: smooth; }`).

### Step 2: Data Mocking (`src/lib/data.ts`)

1. Create a file `src/lib/data.ts` (or `.js`) to hold the dummy data provided in the PRD.
2. Export a `courses` array containing the JSON data from `PRD.md` section 6 (e.g., "Social Media Marketing Mastery 2024", "Full-Stack Web Development").
3. Export a `mentors` array containing the JSON data from `PRD.md` section 6 (e.g., "Sarah Wijaya", "Budi Santoso").
4. Export arrays for `testimonials` (dummy success stories) and `faqs` (common technical/certificate questions).

### Step 3: UI Components Development (`src/lib/components/`)

_Build these components independently before assembling the page. Ensure mobile-first responsiveness (use Tailwind `md:`, `lg:` classes) and ample whitespace for readability._

1. **`Header.svelte`**:
   - Contains Logo/Brand Name.
   - Contains a "Daftar" (Register) button.
   - **Logic**: Implement a "Sticky" behavior. The header should become sticky (fixed at the top) or a floating CTA should appear on mobile after the user scrolls past the Hero section.
2. **`Hero.svelte`**:
   - Headline: Results-centric copy (e.g., "Wujudkan Karir Impianmu").
   - Sub-headline: Emphasize benefits.
   - Primary CTA Button: Links to `#courses`.
   - Promo Ribbon: A small banner or badge highlighting a launch promo.
3. **`TrustBar.svelte`**:
   - A horizontal band displaying dummy partner company logos, average rating (e.g., 4.9/5 stars), and total alumni count.
4. **`CoreValues.svelte` & `FeatureCard.svelte`**:
   - Display the 3 pillars: High Quality Content, Expert Mentors, Recognized Certificates.
   - Use icons for each value.
5. **`CourseCatalog.svelte` & `CourseCard.svelte`**:
   - Grid layout to display the mocked `courses`.
   - `CourseCard` must show: Image, Category, Title, Mentor Name, Original Price (strikethrough), Discount Price, Rating, and a "Daftar Sekarang" button linking to a checkout form/placeholder.
6. **`LimitedPromo.svelte`**:
   - A highly visible section highlighting urgency.
   - Include a **Countdown Timer** (e.g., "Promo berakhir dalam 02:14:59").
   - Show limited quota warnings.
7. **`Testimonials.svelte` & `TestimonialCard.svelte`**:
   - Display success stories ("Dapat kerja setelah 2 bulan") using the mock `testimonials` data.
8. **`FAQ.svelte` & `FaqItem.svelte`**:
   - An accordion-style or list of questions/answers.
9. **`Footer.svelte`**:
   - Basic copyright, links, and secondary CTA.
10. **`SocialProofPopup.svelte` (Optional/Bonus)**:
    - A small, floating toast notification at the bottom left/right corner.
    - **Logic**: Set a timeout/interval to periodically show dummy text like "Ahmad baru saja mendaftar Kursus UI/UX" and hide it after 3 seconds.

### Step 4: Page Assembly (`src/routes/+page.svelte`)

1. Import all components into the main page.
2. Assemble them strictly in this order to follow the **AIDA framework**:
   - `Header`
   - `Hero` (Attention)
   - `TrustBar` (Interest)
   - `CoreValues` (Interest)
   - `<section id="courses">` wrapping `CourseCatalog` (Desire) - _Ensure the ID matches the anchor links used in the Header/Hero._
   - `LimitedPromo` (Urgency)
   - `Testimonials` (Desire)
   - `FAQ` (Action)
   - `Footer`
   - `SocialProofPopup`

### Step 5: Interactivity, Tracking & Final Polish

1. **Event Tracking (Placeholder)**:
   - Create a helper function in `src/lib/utils.ts` for tracking: `export const trackClick = (eventName) => { console.log('Event:', eventName); }`.
   - Attach this function to every "Daftar" or "Daftar Sekarang" button (`on:click={() => trackClick('AddToCart')}`).
2. **Anchor Links**:
   - Verify that clicking the Primary CTA in the Hero scrolls smoothly to the `#courses` section.
3. **Personalized Copy**:
   - Review all hardcoded text to ensure it sounds friendly, direct, and uses the "Kamu" pronoun.
4. **Performance Check**:
   - Run a local build (`npm run build` & `npm run preview`).
   - Run Chrome Lighthouse. Optimize images (use WebP placeholders or Unsplash CDN with correct parameters) and ensure no unnecessary blocking scripts. Target a score of >90.

### Step 6: Commit and PR

- Ensure all code is formatted (`npm run format`).
- Ensure no type errors (`npm run check`).
- Commit changes logically and open a Pull Request for review against this issue.
