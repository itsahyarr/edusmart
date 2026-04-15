# EduSmart

> Conversion-optimized landing page for an Indonesian online education platform, built with SvelteKit and Tailwind CSS.

---

## What Is This?

EduSmart is a **single-page landing page** designed for digital marketing campaigns (Google Ads & Facebook Ads). Its sole purpose is to convert ad traffic into course registrations. The page structure follows the **AIDA framework** (Attention → Interest → Desire → Action) — a proven marketing model.

The entire site is **one page** with no routing, no database, and no backend. All data is mocked in a TypeScript file, ready to be replaced with real API calls later.

**Language:** All user-facing text is in **Bahasa Indonesia** (casual "Kamu" tone).

---

## Tech Stack

| What            | Tool                                              | Why                                                                  |
| --------------- | ------------------------------------------------- | -------------------------------------------------------------------- |
| Framework       | [SvelteKit](https://kit.svelte.dev/) 2.x          | File-based routing, SSR, fast builds                                 |
| UI Library      | [Svelte](https://svelte.dev/) 5.x                 | Reactive with runes (`$state`, `$props`, etc.) — not legacy Svelte 4 |
| Styling         | [Tailwind CSS](https://tailwindcss.com/) 4.x      | Utility-first, mobile-first responsive design                        |
| Language        | [TypeScript](https://www.typescriptlang.org/) 5.x | Type safety                                                          |
| Icons           | [Lucide Svelte](https://lucide.dev/)              | SVG icon library (no emojis)                                         |
| Linting         | ESLint 9 + eslint-plugin-svelte                   | Flat config                                                          |
| Formatting      | Prettier + tailwindcss + svelte plugins           | Auto-sort Tailwind classes                                           |
| Package Manager | [pnpm](https://pnpm.io/)                          | Fast, disk-efficient                                                 |

---

## Quick Start

### Prerequisites

- **Node.js** 18+ (LTS recommended)
- **pnpm** — install with `npm install -g pnpm`

### Setup

```bash
# 1. Clone the repo
git clone https://github.com/itsahyarr/edusmart.git
cd edusmart

# 2. Install dependencies
pnpm install

# 3. Start dev server
pnpm dev
```

Open [http://localhost:5173](http://localhost:5173) in your browser.

### Other Commands

```bash
pnpm build        # Production build (outputs to .svelte-kit/)
pnpm preview      # Preview the production build locally
pnpm check        # Type-check with svelte-check
pnpm lint         # Check formatting (Prettier) + code quality (ESLint)
pnpm format       # Auto-format all files with Prettier
```

---

## Project Structure

```
edusmart/
├── src/
│   ├── app.html                  # HTML shell — loads Google Fonts
│   ├── app.css                   # Global styles, Tailwind directives, custom classes
│   ├── app.d.ts                  # TypeScript declarations
│   │
│   ├── lib/
│   │   ├── components/           # All UI components (see table below)
│   │   ├── data.ts               # Mock data: courses, mentors, testimonials, FAQs
│   │   ├── utils.ts              # Helpers: trackClick(), formatPrice()
│   │   └── images/               # Static SVGs and images
│   │
│   └── routes/
│       ├── +layout.svelte        # Root layout (imports app.css)
│       └── +page.svelte          # The landing page — assembles all components
│
├── static/                       # Served as-is: favicon, robots.txt
├── design-system/edusmart/       # Design system spec (MASTER.md)
│
├── tailwind.config.ts            # Tailwind theme: colors, fonts
├── svelte.config.js              # SvelteKit config (adapter-auto)
├── vite.config.ts                # Vite + Tailwind plugin
├── tsconfig.json                 # TypeScript config
├── eslint.config.js              # ESLint flat config
├── .prettierrc                   # Prettier settings (tabs, single quotes, 100 chars)
│
├── PRD.md                        # Product Requirements Document
├── PLAN.md                       # Step-by-step implementation plan
├── AGENTS.md                     # AI agent instructions (read by pi, Claude, etc.)
└── README.md                     # ← You are here
```

---

## Components

All components live in `src/lib/components/`. They are assembled in a specific order in `+page.svelte` to follow the AIDA marketing framework:

| #   | Component                  | AIDA Phase    | What It Does                                                                      |
| --- | -------------------------- | ------------- | --------------------------------------------------------------------------------- |
| 1   | `Header.svelte`            | —             | Fixed navbar. Logo + nav links + "Daftar Sekarang" CTA. Becomes opaque on scroll. |
| 2   | `Hero.svelte`              | **Attention** | Big headline, promo ribbon, hero stats, floating course preview card.             |
| 3   | `TrustBar.svelte`          | **Interest**  | Partner company logos + platform stats (rating, alumni, courses).                 |
| 4   | `CoreValues.svelte`        | **Interest**  | 3 feature cards: Quality Content, Expert Mentors, Recognized Certificates.        |
| 5   | `CourseCatalog.svelte`     | **Desire**    | Grid of `CourseCard` components showing courses with pricing.                     |
| 6   | ↳ `CourseCard.svelte`      | —             | Single course: image, discount badge, price, rating, CTA button.                  |
| 7   | `LimitedPromo.svelte`      | **Urgency**   | Countdown timer + limited quota warning on gradient background.                   |
| 8   | `Testimonials.svelte`      | **Desire**    | Grid of `TestimonialCard` components with alumni success stories.                 |
| 9   | ↳ `TestimonialCard.svelte` | —             | Single testimonial: quote, star rating, author photo + role.                      |
| 10  | `FAQ.svelte`               | **Action**    | Accordion-style Q&A to remove buyer hesitation.                                   |
| 11  | ↳ `FaqItem.svelte`         | —             | Single expandable Q&A with smooth animation.                                      |
| 12  | `Footer.svelte`            | —             | Brand info, navigation links, contact details, secondary CTA.                     |
| 13  | `SocialProofPopup.svelte`  | **Bonus**     | Rotating toast notification showing recent signups.                               |

---

## Design System

The design is defined in `design-system/edusmart/MASTER.md`. Here's the cheat sheet:

### Colors

| Name       | Hex       | Tailwind Class                  | Used For                               |
| ---------- | --------- | ------------------------------- | -------------------------------------- |
| Primary    | `#0EA5E9` | `text-primary` `bg-primary`     | Brand blue — trust, links, headings    |
| Secondary  | `#38BDF8` | `text-secondary` `bg-secondary` | Lighter blue — accents, gradients      |
| CTA        | `#F97316` | `text-cta` `bg-cta`             | Orange — all "Daftar Sekarang" buttons |
| Background | `#F0F9FF` | `bg-background`                 | Very light blue — page background      |
| Text       | `#0C4A6E` | `text-text`                     | Dark navy — all body text              |

### Typography

- **Headings:** `font-heading` → Rubik (loaded via Google Fonts)
- **Body text:** `font-sans` → Nunito Sans (loaded via Google Fonts)

### Custom CSS Classes

Defined in `src/app.css` under `@layer components`:

| Class          | Purpose                                  |
| -------------- | ---------------------------------------- |
| `.btn-primary` | Orange CTA button with hover lift effect |
| `.card`        | White card with shadow and hover lift    |

### Responsive Breakpoints

Design and test at these widths: **375px** (mobile), **768px** (tablet), **1024px** (desktop), **1440px** (wide).

---

## Data Layer

All content is stored in `src/lib/data.ts` as typed arrays. To change what appears on the page, edit this file:

```typescript
// src/lib/data.ts
export const courses = [...]       // Course catalog (4 items)
export const mentors = [...]       // Mentor profiles (4 items)
export const testimonials = [...]  // Alumni success stories (4 items)
export const faqs = [...]          // FAQ Q&A pairs (6 items)
export const partners = [...]      // Partner company logos (5 items)
export const stats = { ... }       // Platform stats (alumni, rating, etc.)
export const socialProofMessages = [...]  // Popup messages (6 items)
```

### Utilities (`src/lib/utils.ts`)

| Function                     | What It Does                                                               |
| ---------------------------- | -------------------------------------------------------------------------- |
| `formatPrice(n)`             | Formats number as `Rp 599.000` (Indonesian Rupiah)                         |
| `formatDiscount(orig, disc)` | Returns discount percentage as integer                                     |
| `trackClick(name, data?)`    | Logs click events to console — placeholder for Meta Pixel & GA integration |

---

## Svelte 5 Notes

This project uses **Svelte 5 with runes**, not the legacy Svelte 4 syntax. If you're new to Svelte 5:

| Old (Svelte 4)              | New (Svelte 5)                          | Purpose            |
| --------------------------- | --------------------------------------- | ------------------ |
| `export let foo`            | `let { foo } = $props()`                | Component props    |
| `let count = 0`             | `let count = $state(0)`                 | Reactive state     |
| `$: doubled = count * 2`    | `const doubled = $derived(count * 2)`   | Derived values     |
| `$: { console.log(count) }` | `$effect(() => { console.log(count) })` | Side effects       |
| `on:click={handler}`        | `onclick={handler}`                     | Event handlers     |
| `<slot />`                  | `{@render children()}`                  | Content projection |

> **Do NOT** use `export let`, `$:` reactive statements, or `on:click` — they are deprecated in Svelte 5.

---

## Formatting & Code Style

| Setting          | Value                          |
| ---------------- | ------------------------------ |
| Indentation      | Tabs                           |
| Quotes           | Single quotes                  |
| Trailing commas  | None                           |
| Print width      | 100 characters                 |
| Tailwind classes | Auto-sorted by Prettier plugin |

Always run `pnpm format` before committing.

---

## Adding a New Section

1. Create a new component: `src/lib/components/MySection.svelte`
2. If it has data, add it to `src/lib/data.ts`
3. Import and add it to `src/routes/+page.svelte` in the correct AIDA position
4. Run quality gates:

```bash
pnpm check && pnpm lint
```

---

## Adding a New Course

Open `src/lib/data.ts` and add an object to the `courses` array:

```typescript
{
  id: 5,
  category: 'Data Science',
  title: 'Machine Learning Fundamentals',
  mentor: 'New Mentor Name',
  originalPrice: 799000,
  discountPrice: 199000,
  rating: 4.8,
  students: 430,
  image: 'https://images.unsplash.com/photo-...',
  description: 'Course description here.'
}
```

The `CourseCatalog.svelte` component automatically renders all courses from the array.

---

## Deployment

The project uses `@sveltejs/adapter-auto` which auto-detects the deployment platform. To deploy:

```bash
pnpm build
```

For specific platforms, install the appropriate adapter:

- **Vercel:** `pnpm add -D @sveltejs/adapter-vercel`
- **Netlify:** `pnpm add -D @sveltejs/adapter-netlify`
- **Cloudflare:** `pnpm add -D @sveltejs/adapter-cloudflare`

Then update `svelte.config.js` to use it.

---

## Key Documentation Files

| File                               | Purpose                                                                 |
| ---------------------------------- | ----------------------------------------------------------------------- |
| `PRD.md`                           | Product requirements — business goals, AIDA structure, KPIs             |
| `PLAN.md`                          | Step-by-step implementation plan                                        |
| `AGENTS.md`                        | Instructions for AI coding agents (pi, Claude, etc.)                    |
| `design-system/edusmart/MASTER.md` | Full design system spec — colors, typography, components, anti-patterns |

---

## License

Private project. All rights reserved.
