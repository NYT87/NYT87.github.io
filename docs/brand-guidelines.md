# NYT87 Brand Guidelines v1.0

> Last updated: 2026-10-31
> Status: Active
> Source of truth for tokens: `src/layouts/Layout.astro` (`:root`) and `design-system/nyt87/MASTER.md`.
> This document is the human-readable brand reference. Hex values below are sRGB conversions of the
> oklch tokens in the layout; the oklch values are canonical.

## Quick Reference

| Element | Value |
|---------|-------|
| Primary Color | #B34200 (Signal Orange) |
| Secondary Color | #16707B (Console Teal) |
| Primary Font | Space Grotesk (headings), Manrope (body), JetBrains Mono (metadata) |
| Voice | Formal, Geeky, Calmly confident |
| Tagline | Designing and engineering products that survive real-world scale. |
| Descriptor | Remote software studio / Product, backend & infrastructure |

---

## 1. Color Palette

The palette is warm and precise: a parchment background, near-black warm text, a single orange
for emphasis and action, and a muted teal for links. Dark mode keeps the same roles on a cool
graphite base. Colors are defined in oklch so light and dark variants share perceived lightness.

### Primary Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| Signal Orange | #B34200 | rgb(179,66,0) | `--brand-text`: index numbers, markers, emphasised mono labels (light mode) |
| Signal Orange Fill | #BE4500 | rgb(190,69,0) | `--brand-fill`: primary button fill end |
| Signal Orange Deep | #A93900 | rgb(169,57,0) | `--brand-strong`: primary button fill start, hover |
| Signal Orange Bright | #DD5C00 | rgb(221,92,0) | `--brand`: decorative only (button shadow, focus ring base). Never for text |
| Signal Orange Dark Mode | #F88F4F | rgb(248,143,79) | `--brand-text` in dark mode |

### Secondary Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| Console Teal | #16707B | rgb(22,112,123) | `--accent`: text links, hover borders (light mode) |
| Console Teal Dark Mode | #65C1CF | rgb(101,193,207) | `--accent` in dark mode |
| Teal Wash | 7% Console Teal over transparent | — | `--accent-wash`: row hover, secondary button hover |
| Focus Ring | #F47F46 | rgb(244,127,70) | `--focus-ring`: 3px keyboard focus outline, offset 3px |

### Neutral Palette

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| Background | #FAF4EE | rgb(250,244,238) | `--bg`: page background (light) |
| Surface | #FFFBF6 | rgb(255,251,246) | `--surface`: code blocks, inline code |
| Surface Strong | #FFFFFC | rgb(255,255,252) | `--surface-strong`: raised panels (mobile menu) |
| Text Primary | #191511 | rgb(25,21,17) | `--text`: headings, lead paragraphs, button labels |
| Text Secondary | #5E574F | rgb(94,87,79) | `--muted`: body copy, labels, metadata |
| Border | #CFC9C4 | rgb(207,201,196) | `--border`: hairline rules between rows |
| Line Strong | #B1A9A2 | rgb(177,169,162) | `--line-strong`: section rules, secondary button borders |
| Background Dark | #0E1216 | rgb(14,18,22) | `--bg` in dark mode |
| Surface Dark | #191D22 | rgb(25,29,34) | `--surface` in dark mode |
| Surface Strong Dark | #20252A | rgb(32,37,42) | `--surface-strong` in dark mode |
| Text Primary Dark | #EFEBE4 | rgb(239,235,228) | `--text` in dark mode |
| Text Secondary Dark | #B9B3AA | rgb(185,179,170) | `--muted` in dark mode |
| Border Dark | #424850 | rgb(66,72,80) | `--border` in dark mode |
| Line Strong Dark | #6B727A | rgb(107,114,122) | `--line-strong` in dark mode |

### Semantic Colors

The site has no forms or stateful UI, so no success, warning or error colors are defined.
If one is needed, derive it in oklch at the same lightness as `--brand-text` for its theme and
verify 4.5:1 against `--bg` before use.

| State | Hex | Usage |
|-------|-----|-------|
| Emphasis | #B34200 | Only one emphasis color: Signal Orange |
| Interactive | #16707B | Only one link color: Console Teal |

### Accessibility

Measured against the page background of the same theme.

| Pair | Light | Dark |
|------|-------|------|
| Text Primary / Background | 16.6:1 | 15.8:1 |
| Text Secondary / Background | 6.5:1 | 9.0:1 |
| Signal Orange text / Background | 5.2:1 | 8.1:1 |
| Console Teal link / Background | 5.3:1 | 9.0:1 |
| Button label / Primary button fill | 5.0:1 | 5.0:1 |

- All text pairs meet WCAG 2.1 AA (4.5:1); primary and secondary text meet AAA.
- Focus ring is always visible: 3px `--focus-ring`, 3px offset, on every focusable element.
- Tap targets are at least 44px.

---

## 2. Typography

Three families, three jobs. Headings carry the voice, body carries the argument, mono carries
the metadata. Never introduce a fourth family.

### Font Stack

```css
--font-heading: 'Space Grotesk', 'Space Grotesk Fallback', sans-serif;
--font-body: 'Manrope', 'Manrope Fallback', sans-serif;
--font-mono: 'JetBrains Mono', ui-monospace, 'SFMono-Regular', Menlo, monospace;
```

Fallbacks are metric-adjusted `@font-face` aliases of Arial so text does not reflow when the web
fonts arrive.

### Type Scale

Sizes are fluid `clamp()` values in the layout; the columns below give the two ends.

| Element | Font | Weight | Size (Desktop / Mobile) | Line Height | Tracking |
|---------|------|--------|------------------------|-------------|----------|
| H1 (hero) | Space Grotesk | 500 | 90px / 42px | 1.02 | -0.04em |
| H1 (subpages) | Space Grotesk | 500 | 70px / 38px | 1.04 | -0.04em |
| H2 (section title) | Space Grotesk | 500 | 54px / 32px | 1.1 | -0.03em |
| H3 (row title) | Space Grotesk | 500 | 26px / 21px | 1.1 | -0.03em |
| Lead | Manrope | 400 | 20px / 17px | 1.65 | 0 |
| Body | Manrope | 400 | 18px / 16px | 1.65 | 0 |
| Button | Space Grotesk | 500 | 15px / 15px | 1 | 0.01em |
| Mono label | JetBrains Mono | 400 | 12.5px / 12.5px | 1.4 | 0.06em, uppercase |

Rules:

- Headings use `text-wrap: balance`, never auto-hyphenate, and never exceed 20ch (section
  titles) or 16ch (hero).
- Body measure stays at or under 62ch; long-form prose on project pages at or under 68ch.
- Mono labels never go below 0.72rem.
- Body copy is `--muted`; only headings, leads, strong text and button labels use `--text`.

### Font Loading

```html
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  rel="stylesheet"
  href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500&family=Manrope:wght@400;500;700&family=Space+Grotesk:wght@500;700&display=swap"
/>
```

---

## 3. Logo Usage

The mark is a blue knot icon; the wordmark is "nyt87" in lowercase. The mark is the only
blue element in the system, which is deliberate: it stays recognisable against the warm palette.

### Variants

| Variant | File | Size | Use Case |
|---------|------|------|----------|
| Icon | `public/assets/logo-icon.png` | 434×434 | Favicon, nav mark, app icons, avatars |
| Wordmark (light) | `public/assets/logo-text.png` | 804×268 | Nav and footer on light backgrounds |
| Wordmark (dark) | `public/assets/logo-text-white.png` | 804×268 | Nav and footer on dark backgrounds |
| Lockup (light) | `public/assets/brand.png` | 1024×1024 | Open Graph image, documents, slides |
| Lockup (dark) | `public/assets/brand-dark.png` | 1024×1024 | Dark presentations and social |

The same files live in `src/assets/brand/` for Astro image optimisation; `public/` copies are for
static references (manifest, Open Graph).

### Clear Space

Minimum clear space on every side equals the height of the icon mark.

### Minimum Size

| Context | Minimum |
|---------|---------|
| Digital, icon | 16px (favicon), 28px in the nav |
| Digital, wordmark | 20px tall (footer), 24px tall (nav) |
| Print, lockup | 30mm wide |

### Don'ts

- Don't recolor the mark or the wordmark; use the light or dark variant instead.
- Don't rotate, skew, outline or add shadows or glows.
- Don't place the lockup on orange or teal fills.
- Don't set "NYT87" in a different typeface as a substitute for the wordmark.
- Don't pair the mark with a tagline inside the clear space.

---

## 4. Voice & Tone

The site should read like a well-set engineering document: structured, specific, unhurried.
Credibility comes from clear writing and real work, not from volume.

### Brand Personality

| Trait | Description |
|-------|-------------|
| **Formal** | Complete sentences, precise nouns, no slang, no exclamation marks |
| **Geeky** | Comfortable with technical detail; names the stack, the constraint, the trade-off |
| **Smart** | Explains the reasoning, not just the result; respects the reader's expertise |
| **Calmly confident** | States what we do and what it costs the client to skip it, without hype |

### Voice Chart

| Trait | We Are | We Are Not |
|-------|--------|------------|
| Formal | Measured, editorial | Stiff, bureaucratic |
| Geeky | Concrete about systems and tools | Showing off with jargon |
| Smart | Clear about trade-offs | Condescending |
| Calmly confident | Direct about outcomes | Boastful, salesy |

### Tone by Context

| Context | Tone | Example |
|---------|------|---------|
| Homepage hero | Declarative, high altitude | "Designing and engineering products that survive real-world scale." |
| Service and project copy | Specific, outcome-first | "Scalable APIs and core services with observability, domain modeling, and resilient integrations." |
| Project pages | Explanatory, honest about status | "Bongsu is in early development under the MIT license and is not yet deployed." |
| Contact | Invitational, plain | "Bring us the problem you are trying to solve." |
| README and docs | Instructional, terse | "Add a Markdown file to `src/content/projects/`." |
| GitHub profile | Same copy as the site, trimmed to lists | Mirror the homepage; do not write a separate pitch |

### Writing Rules

- Lead with what the work does for the client; the technology follows.
- Prefer one strong claim to three weak ones. Never invent proof: no made-up metrics, logos
  or testimonials. Only real projects, real clients and real contributions.
- Use "we" for the studio and the person's name on the team page. Clients are named only
  with permission.
- Sentence case for headings. Numbered section indexes (`01 / Services`) are mono and uppercase.
- British or American spelling is acceptable; be consistent within a page (the site currently
  uses American spelling).

### Prohibited Terms

| Avoid | Reason |
|-------|--------|
| Revolutionary, game-changing | Hype; the brand earns trust with evidence |
| Seamless, frictionless | Overused and unverifiable |
| Cutting-edge, next-gen, AI-powered | Vague; name the actual technique instead |
| World-class, best-in-class | Unprovable superlative |
| Leverage, synergy, unlock | Corporate filler |
| Passionate, rockstar, ninja | Startup clichés at odds with a formal voice |
| Solutions (as a noun for our work) | Say what we build: products, services, systems |

### Forbidden Phrases

- "We are a team of passionate developers"
- "Let's build something amazing together"
- "Your success is our success"
- "Cutting-edge technology for the modern world"
- "Trusted by thousands"

---

## 5. Imagery Guidelines

The site is almost image-free by design. Structure, typography and rules do the visual work.

### Photography Style

- **Subjects:** Real team members only, head and shoulders, looking at the camera.
- **Lighting:** Soft, even, natural; no dramatic shadows.
- **Treatment:** Neutral color, no filters. Square crop, `--radius-md` (12px) corners, 1px
  `--border` edge.
- **Sizes:** 160px on the homepage, 240px on the team page, served at 1x and 2x via
  `astro:assets`.

### Illustrations

- None on the site today. If added: single-weight line drawings in `--muted` or `--text`, one
  Signal Orange accent at most, no gradients, no 3D, no stock isometric scenes.

### Icons

- None on the site today; the nav menu uses a CSS hamburger. If added: outlined, 24px grid,
  1.5px stroke, square corners, currentColor fill.

### Screenshots and Diagrams

- Product screenshots: real UI, device-frame free, on `--surface` with a 1px `--border`.
- Architecture diagrams: boxes and hairlines in `--line-strong`, labels in JetBrains Mono,
  one orange highlight for the component being discussed.

---

## 6. Design Components

### Layout

| Token | Value |
|-------|-------|
| Max content width | 1120px |
| Page gutter | clamp(1rem, 3vw, 1.4rem) |
| Section grid | 3fr index column / 9fr content; single column under 900px |
| Section padding | clamp(2.5rem, 5vw, 4rem) top, clamp(3rem, 6vw, 5rem) bottom |
| Nav height | 4.5rem (4rem on phones) |

### Buttons

| Type | Background | Text | Border | Radius | Min height |
|------|------------|------|--------|--------|------------|
| Primary | linear-gradient(135deg, #A93900, #BE4500) | #FEFBF9 | none | 8px | 44px |
| Secondary (outline) | transparent | `--text` | 1px `--line-strong`; teal on hover | 8px | 44px |
| Text link | none | `--accent`, underlined 1px, 0.2em offset | none | — | 32px row height |

One primary button per view. The conversion path is always "Contact".

### Rules and Lists

- Every section opens with a 1px `--line-strong` rule aligned to the content edges.
- Indexed rows (services, work, steps) are separated by 1px `--border` hairlines, no cards,
  no backgrounds; hover tints the row with `--accent-wash`.
- Spec lists (`<dl>`) use a mono term column and a body definition column.

### Spacing Scale

| Token | Value | Usage |
|-------|-------|-------|
| xs | 0.35rem | Gap inside stacked labels |
| sm | 0.75rem | Button groups, crumb gaps |
| md | 1rem | Paragraph gaps, dl rows |
| lg | 1.5rem | Row grids, prose section gaps |
| xl | 2rem–3rem | Section body gaps (`clamp(2rem, 4vw, 3rem)`) |
| 2xl | 4rem–5rem | Hero body offset, section padding |

### Border Radius

| Element | Radius |
|---------|--------|
| Buttons, inputs, focus outline | 8px (`--radius-sm`) |
| Photos, panels | 12px (`--radius-md`) |
| Inline code | 4px |
| Pills or tags | Not used; tags are plain mono labels |

### Motion

- One `fade-up` reveal on page load for hero content (0.6s, staggered 80ms). Nothing on
  scroll, no parallax, no scroll-driven animation.
- Hover transitions 0.2s ease on color, border and background.
- Everything is disabled under `prefers-reduced-motion`.

---

## 7. Messaging

### Core Attributes

| Attribute | Description |
|-----------|-------------|
| **Survives scale** | We build products, backends and infrastructure that hold up under real load and real change |
| **Senior and direct** | A small senior team; the person who scopes the work builds it |
| **Documented delivery** | Clear owners, documented decisions, milestones tied to shipping |
| **Remote-first** | Async-capable collaboration inside the client's own workflow and time zones |
| **Proof over promises** | Real client work, open-source studio projects and upstream contributions |

### Positioning Statement

For startups and established product teams who cannot afford weak execution, unclear ownership
or an expensive rewrite later, NYT87 is a remote software studio that delivers product, backend
and infrastructure work with senior engineering judgment, maintainable architecture and
predictable delivery.

### Primary Message

Designing and engineering products that survive real-world scale.

### Supporting Messages

1. Senior engineering across product delivery, systems and infrastructure.
2. Clarify, build, sustain: ambiguous ideas become clear scope, visible milestones and
   maintainable systems.
3. Remote-first, embedded in your workflow, transparent from day one.
4. Public proof: client work for Criptan, open-source tools in daily use, and merged
   contributions to Drift.

### Elevator Pitches

- **One line:** NYT87 is a remote software studio that builds product, backend and
  infrastructure work that survives real-world scale.
- **Thirty seconds:** NYT87 is a small senior engineering studio. We work with startups and
  established teams on backend services, full-stack products and cloud infrastructure, inside
  their own workflow, with documented decisions and milestones tied to shipping. Our main
  client is Criptan, a regulated fintech; our own open-source tools and upstream contributions
  are public on GitHub.

---

## AI Image Generation

Images are rare on this brand. When one is needed (social cards, slide backgrounds), it should
look like a page from the site, not a stock photo.

### Base Prompt Template

Always prepend to image generation prompts:

```
Editorial-technical composition on a warm parchment background (#FAF4EE), near-black warm text (#191511), thin grey hairline rules (#B1A9A2), one accent in deep signal orange (#B34200), optional muted teal (#16707B) for a single link-like detail. Structured grid, generous whitespace, monospace uppercase labels, Space Grotesk-style geometric headings. Calm, precise, no gradients, no glass, no glow, no 3D, no stock photography.
```

### Style Keywords

| Category | Keywords |
|----------|----------|
| **Lighting** | flat, even, paper-like, no dramatic shadows |
| **Mood** | calm, precise, formal, intelligent, quietly confident |
| **Composition** | strict grid, left-aligned, numbered index, hairline rules, generous margins |
| **Treatment** | matte, muted, low saturation except one orange accent |
| **Aesthetic** | editorial-technical, engineering document, system console, architectural drawing |

### Visual Mood Descriptors

- A well-set engineering document
- Warm paper, cool graphite in dark mode
- One signal, not a fireworks show
- Structure over decoration

### Visual Don'ts

| Avoid | Reason |
|-------|--------|
| Glassmorphism, frosted panels | Explicitly ruled out by the brand brief |
| Gradients as decoration, neon glows | Reads as generic AI-era startup |
| Hero metric cards, lifted card grids | Invented proof and SaaS tropes |
| Trust blue as the dominant color | The only blue is the logo mark |
| Stock photos of laptops, handshakes, abstract networks | Not real, not ours |
| Isometric 3D illustrations | Off-voice; the brand is flat and typographic |

### Example Prompts

**Hero Banner**:
```
Editorial-technical composition on warm parchment (#FAF4EE): a large geometric sans-serif headline "Designing and engineering products that survive real-world scale." top-left, a thin horizontal hairline rule (#B1A9A2) beneath, a small monospace uppercase label "01 / SERVICES" in signal orange (#B34200) at the lower left, generous whitespace, flat even lighting, no gradients, no glow, no photos.
```

**Social Media Post**:
```
Square social card on warm parchment (#FAF4EE) with a 1px grey hairline border inset, a small blue knot logo mark top-left, a monospace uppercase label "OPEN SOURCE · WEB APP · PWA" in muted grey (#5E574F), a bold geometric sans-serif project title in near-black (#191511), a single orange (#B34200) index number "02", flat lighting, matte, no gradients, no 3D.
```

---

## Changelog

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-10-31 | Initial guidelines, derived from `.impeccable.md`, `design-system/nyt87/MASTER.md` and the layout tokens |
