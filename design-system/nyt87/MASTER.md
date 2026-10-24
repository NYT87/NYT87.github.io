# NYT87 Design System (Master)

Source of truth for the NYT87 site. Built from `.impeccable.md` (the brand brief) plus the
verified parts of the ui-ux-pro-max recommendations. Where the two conflicted, the brief won:
the generator's default (glassmorphism, trust blue, Plus Jakarta Sans) was rejected as the
generic SaaS look the brief rules out.

Page-specific overrides go in `pages/<page>.md`; if none exists, use this file.

## Direction

Editorial-technical. The page reads like a well-set engineering document: a numbered section
index, hairline rules, a strict grid, and monospace metadata. Credibility comes from structure
and clear writing, not from decoration.

- Prefer rules and whitespace over cards. No repeated lifted cards, no glass, no gradients
  as decoration, no hero metric tiles.
- Never invent proof (client logos, stats, testimonials). Use only real work and real claims.
- One primary call to action per view; the conversion path is "Contact".

## Page structure

| # | Section | Anchor | Purpose |
|---|---------|--------|---------|
| — | Hero | top | Promise, lead, primary CTA, "how we work" spec list |
| 01 | Services | `#services` | What we build, as an indexed list |
| 02 | Work | `#projects` | Proof: real public projects, each with its own type tag |
| 03 | Approach | `#about` | Positioning statement and the three-step engagement |
| 04 | Team | `#team` | Who you work with |
| 05 | Contact | `#contact` | The conversion block: email first, GitHub and LinkedIn second |

Each section uses the two-column section grid: a sticky index label (`01 / Services`) on the
left (3/12), content on the right (9/12). Below 900px it collapses to one column and the label
sits above the content.

## Typography

| Role | Family | Use |
|------|--------|-----|
| Display / headings | Space Grotesk 500/700 | h1–h4, buttons |
| Body | Manrope 400/500/700 | paragraphs, lists |
| Metadata | JetBrains Mono 400/500 | section index, labels, tags, spec terms |

- h1: `clamp(2.6rem, 1.6rem + 4.4vw, 5.6rem)`, line-height 1.02, tracking -0.04em.
- Section title: `clamp(2rem, 1.4rem + 2.2vw, 3.4rem)`.
- Body 1rem–1.1rem, line-height 1.65; lead 1.05rem–1.25rem; measure ≤ 62ch.
- Mono labels 0.78rem uppercase, tracking 0.06em. Never below 0.72rem.
- Headings never auto-hyphenate.

## Color tokens

Defined in `src/layouts/Layout.astro` on `:root`, redefined for dark mode. All text pairs
verified ≥ 4.5:1 in both themes.

| Token | Light | Dark | Use |
|-------|-------|------|-----|
| `--bg` | oklch(0.97 0.01 70) | oklch(0.18 0.01 250) | page |
| `--surface-strong` | oklch(1 0.004 70) | oklch(0.26 0.012 250) | raised surfaces (menu panel) |
| `--text` | oklch(0.2 0.01 70) | oklch(0.94 0.01 80) | primary text |
| `--muted` | oklch(0.46 0.015 70) | oklch(0.77 0.015 80) | secondary text |
| `--line-strong` / `--border` | warm greys | cool greys | rules |
| `--brand-text` | oklch(0.53 0.16 43) | oklch(0.75 0.15 50) | orange text (index numbers, links) |
| `--accent` | oklch(0.5 0.08 208) | oklch(0.76 0.09 208) | teal links |
| `--brand-strong` → `--brand-fill` | dark orange gradient | same | primary button fill |
| `--on-brand` | oklch(0.99 0.004 70) | same | primary button text |

Decorative-only: `--brand` (shadows, focus ring base). Never use `--brand` for text.

## Components

- **Button**: radius 8px, min-height 44px. Primary = orange gradient + `--on-brand`.
  Secondary = transparent with `--line-strong` border and `--text` label.
- **Section index**: mono, `--muted`, number in `--brand-text`.
- **Indexed list rows** (services, work, steps): top hairline, generous padding, no
  background; hover may tint the background with `--accent-wash`.
- **Spec list** (`<dl>`): mono term column + body definition, hairline between rows.

## Layout and spacing

- Max content width 1120px; gutter `clamp(1rem, 3vw, 1.4rem)`.
- Section padding `clamp(2.5rem, 5vw, 4rem)` top, `clamp(3rem, 6vw, 5rem)` bottom; every section
  starts with a rule aligned to the content edges (not the gutters).
- Formatting: Biome owns `.astro` frontmatter; Prettier (`astroSkipFrontmatter`) owns markup.
- Fixed nav is 4.5rem tall (4rem on phones); `scroll-padding-top` = `--section-anchor-offset`.

## Motion

Restrained: a single fade-up for the hero on load, nothing on scroll. All motion is disabled
under `prefers-reduced-motion`. Avoid scroll-driven animations: the build's CSS minifier has
broken `animation-timeline` before.

## Accessibility checklist

- Text contrast ≥ 4.5:1 in both themes; focus ring always visible (3px, offset 3px).
- Skip link; one h1; h2 per section; h3 for items.
- Tap targets ≥ 44px; anchor jumps and keyboard focus clear the fixed nav.
- Images through `astro:assets` with explicit sizes; decorative images get `alt=""`.
