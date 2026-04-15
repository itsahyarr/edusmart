# Agent Instructions

## RTK — Token Optimization (ALWAYS ACTIVE)

**RTK (Rust Token Killer)** is installed and MUST be used as a prefix on ALL shell commands to save 60-90% tokens.

```bash
# ✅ DO — prefix every shell command with rtk
rtk ls src/lib/components/
rtk git status
rtk pnpm install
rtk pnpm build
rtk tree src/
rtk grep -r "pattern" src/
rtk find src/ -name "*.svelte"
rtk gh issue view 1
rtk diff HEAD~1

# ❌ DON'T — running commands without rtk prefix
ls src/lib/components/
git status
pnpm install
```

**Commands that don't need rtk:** `cp`, `mv`, `rm`, `mkdir`, `echo`, `cat`, `cd` (simple file ops that produce minimal output)

**Non-interactive flags are still required:**

```bash
cp -f source dest           # NOT: cp source dest
mv -f source dest           # NOT: mv source dest
rm -f file                  # NOT: rm file
rm -rf directory            # NOT: rm -r directory
```

---

This project uses **bd (beads)** for issue tracking. Run `bd prime` for full workflow context.

## Quick Reference

```bash
bd ready              # Find available work
bd show <id>          # View issue details
bd update <id> --claim  # Claim work atomically
bd close <id>         # Complete work
bd dolt push          # Push beads data to remote
```

<!-- BEGIN BEADS INTEGRATION v:1 profile:minimal hash:ca08a54f -->

## Beads Issue Tracker

This project uses **bd (beads)** for issue tracking. Run `bd prime` to see full workflow context and commands.

### Quick Reference

```bash
bd ready              # Find available work
bd show <id>          # View issue details
bd update <id> --claim  # Claim work
bd close <id>         # Complete work
```

### Rules

- Use `bd` for ALL task tracking — do NOT use TodoWrite, TaskCreate, or markdown TODO lists
- Run `bd prime` for detailed command reference and session close protocol
- Use `bd remember` for persistent knowledge — do NOT use MEMORY.md files

## Session Completion

**When ending a work session**, you MUST complete ALL steps below. Work is NOT complete until `git push` succeeds.

**MANDATORY WORKFLOW:**

1. **File issues for remaining work** - Create issues for anything that needs follow-up
2. **Run quality gates** (if code changed) - Tests, linters, builds
3. **Update issue status** - Close finished work, update in-progress items
4. **PUSH TO REMOTE** - This is MANDATORY:
   ```bash
   rtk git pull --rebase
   bd dolt push
   rtk git push
   rtk git status  # MUST show "up to date with origin"
   ```
5. **Clean up** - Clear stashes, prune remote branches
6. **Verify** - All changes committed AND pushed
7. **Hand off** - Provide context for next session

**CRITICAL RULES:**

- Work is NOT complete until `git push` succeeds
- NEVER stop before pushing - that leaves work stranded locally
- NEVER say "ready to push when you are" - YOU must push
- If push fails, resolve and retry until it succeeds
<!-- END BEADS INTEGRATION -->

---

## Project Overview

**EduSmart** is a conversion-optimized landing page for an online education platform targeting Indonesian audiences. The page follows the **AIDA framework** (Attention → Interest → Desire → Action) and is designed for digital marketing campaigns (Google Ads & Facebook Ads).

- **Product:** Online course platform (Digital Marketing, Web Development, etc.)
- **Language:** Indonesian (Bahasa Indonesia) — all user-facing copy uses "Kamu" pronoun, friendly/casual tone
- **Business Goal:** Maximize lead generation / registration conversions
- **Key Docs:** `PRD.md` (product requirements), `PLAN.md` (implementation plan), `design-system/edusmart/MASTER.md` (design system)

---

## Tech Stack

| Layer           | Technology                                                               | Version                                           |
| --------------- | ------------------------------------------------------------------------ | ------------------------------------------------- |
| Framework       | **SvelteKit**                                                            | 2.x                                               |
| UI              | **Svelte**                                                               | 5.x (uses runes: `$state`, `$derived`, `$effect`) |
| Styling         | **Tailwind CSS**                                                         | 4.x (via `@tailwindcss/vite` plugin)              |
| Language        | **TypeScript**                                                           | 5.x                                               |
| Package Manager | **pnpm**                                                                 | workspace configured                              |
| Linting         | **ESLint** 9 (flat config) + `eslint-plugin-svelte`                      |
| Formatting      | **Prettier** + `prettier-plugin-svelte` + `prettier-plugin-tailwindcss`  |
| Icons           | Use **Lucide Svelte** (or similar SVG icon library) — NO emojis as icons |
| Adapter         | `@sveltejs/adapter-auto`                                                 |

---

## Build & Dev Commands

```bash
rtk pnpm install          # Install dependencies
rtk pnpm dev              # Start dev server (no rtk needed for dev server)
rtk pnpm build            # Production build
rtk pnpm preview          # Preview production build
rtk pnpm check            # Type-check with svelte-check
rtk pnpm lint             # Run ESLint + Prettier check
pnpm format               # Auto-format all files (writes files, minimal output)
```

### Quality Gates (run before committing)

```bash
rtk pnpm check && rtk pnpm lint
```

---

## Architecture

```
src/
├── app.html              # HTML shell (Google Fonts loaded here)
├── app.css               # Global styles + Tailwind + custom component classes
├── app.d.ts              # TypeScript declarations
├── lib/
│   ├── components/       # Reusable Svelte components
│   ├── data.ts           # Mock data (courses, mentors, testimonials, FAQs)
│   ├── images/           # Static images/SVGs
│   └── utils.ts          # Helper functions (tracking, formatting)
└── routes/
    ├── +layout.svelte    # Root layout (imports app.css)
    └── +page.svelte      # Landing page — assembles all sections

static/                   # Static assets (favicon, robots.txt)
design-system/edusmart/   # Design system spec (MASTER.md)
```

### Page Assembly Order (AIDA Framework)

The landing page (`+page.svelte`) assembles sections in this specific order:

1. **Header** — Fixed nav with logo + CTA button
2. **Hero** — Headline, sub-headline, promo ribbon, CTA
3. **TrustBar** — Partner logos, ratings, alumni count
4. **CoreValues** — 3 pillars (Content, Mentors, Certificates)
5. **CourseCatalog** — Course cards with pricing (section id="courses")
6. **LimitedPromo** — Countdown timer, urgency, scarcity
7. **Testimonials** — Alumni success stories
8. **FAQ** — Accordion Q&A
9. **Footer** — Links, secondary CTA
10. **SocialProofPopup** — Floating toast notifications (optional)

---

## Design System

Source of truth: `design-system/edusmart/MASTER.md`

### Brand Colors

| Role       | Hex       | Tailwind Class                    |
| ---------- | --------- | --------------------------------- |
| Primary    | `#0EA5E9` | `text-primary` / `bg-primary`     |
| Secondary  | `#38BDF8` | `text-secondary` / `bg-secondary` |
| CTA/Accent | `#F97316` | `text-cta` / `bg-cta`             |
| Background | `#F0F9FF` | `bg-background`                   |
| Text       | `#0C4A6E` | `text-text`                       |

### Typography

- **Headings:** Rubik (`font-heading`)
- **Body:** Nunito Sans (`font-sans` — Tailwind default)

### Custom CSS Classes (defined in `app.css`)

- `.btn-primary` — Orange CTA button with hover lift
- `.btn-secondary` — Outlined primary button
- `.card` — White card with shadow + hover lift

### Anti-Patterns (NEVER do these)

- ❌ Emojis as icons — use SVG icons only (Lucide/Heroicons)
- ❌ Layout-shifting hovers (no `scale` on hover)
- ❌ Low contrast text (4.5:1 minimum)
- ❌ Missing `cursor-pointer` on clickable elements
- ❌ Instant state changes — always use transitions (150-300ms)
- ❌ Invisible focus states
- ❌ Complex navigation or hidden contact info

### Responsive Breakpoints

Test at: **375px**, **768px**, **1024px**, **1440px**

---

## Code Conventions

### Svelte 5 Patterns

- Use **runes** (`$state`, `$derived`, `$effect`) — this is Svelte 5, not legacy reactive declarations
- Use `$props()` for component props instead of `export let`
- Use `$bindable()` for two-way binding props

### File Naming

- Components: **PascalCase.svelte** (e.g., `CourseCard.svelte`, `TrustBar.svelte`)
- Data/utils: **camelCase.ts** (e.g., `data.ts`, `utils.ts`)
- Routes: SvelteKit convention (`+page.svelte`, `+layout.svelte`)

### Tailwind Usage

- Use Tailwind utility classes directly in markup
- Custom component classes (`.btn-primary`, `.card`) defined in `app.css` under `@layer components`
- Use Tailwind custom colors: `text-primary`, `bg-cta`, `text-text`, etc.
- Mobile-first: write base styles for mobile, then `md:` and `lg:` for larger screens

### Formatting Rules

- **Tabs** for indentation (not spaces)
- **Single quotes** for strings
- **No trailing commas**
- **100 char** print width
- Prettier auto-sorts Tailwind classes

---

## Data Layer

Mock data lives in `src/lib/data.ts`. Contains:

- `courses[]` — Course catalog with pricing, ratings, images
- `mentors[]` — Mentor profiles with photos
- Add `testimonials[]` and `faqs[]` as the page grows

### Price Formatting

Use `toLocaleString()` for Indonesian Rupiah display: `Rp {price.toLocaleString()}`

---

## Tracking & Analytics

Event tracking is implemented as placeholder functions in `src/lib/utils.ts`:

- `trackClick(eventName)` — logs to console; will integrate Meta Pixel & Google Analytics later
- Attach to all CTA buttons ("Daftar Sekarang", "Mulai Belajar")

---

## Performance Targets

- **Lighthouse score:** 90+ on all metrics
- **Page load:** < 2 seconds
- **No horizontal scroll** on any viewport
- Use WebP images where possible (Unsplash CDN supports format params)
