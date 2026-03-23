# Interface Audit Report

Project: `nyt87`
Date: 2026-03-23
Scope: Marketing site in `src/pages/index.astro`, `src/layouts/Layout.astro`, and `src/components/*.astro`

## Anti-Patterns Verdict
Fail. This does not look egregiously AI-generated, but it still trips several common AI-era tells from the frontend-design guidance:

- Glassy blurred navbar and repeated soft gradient cards create a generic SaaS aesthetic instead of a distinct point of view.
- The hero uses the exact metric-card pattern the design guidance warns against.
- Rounded panels and hover-lift cards are repeated across most sections, flattening hierarchy.
- Typography is competent but still close to common default “modern startup” output.

The site is clean and functional, but the visual language is safer and more templated than it should be.

## Executive Summary
- Total issues: 8
- Critical: 0
- High: 2
- Medium: 4
- Low: 2
- Overall quality score: 6.5/10

Most critical issues:
1. Mobile users lose section navigation entirely below 900px.
2. Keyboard users do not get reliable visible focus treatment on links and CTA controls.
3. The page lacks a `main` landmark, which weakens screen reader navigation.
4. The visual system relies on repeated glass-card and hero-metric patterns that make the site feel generic.

Recommended next steps:
1. Fix navigation and focus states first.
2. Improve landmarks and interactive affordances.
3. Normalize tokens and remove hard-coded colors.
4. Redesign the hero and repeated card surfaces to avoid generic startup patterns.

## Detailed Findings by Severity

### High-Severity Issues

#### 1. Mobile navigation disappears with no replacement
- Location: `src/components/Navigation.astro:80`
- Severity: High
- Category: Responsive / Accessibility
- Description: The navigation links are hidden below `900px`, but there is no mobile menu, drawer, or alternate set of in-page navigation controls.
- Impact: Mobile and small-tablet users lose direct access to key sections, which makes orientation and movement through the page slower and increases abandonment risk.
- WCAG/Standard: WCAG 2.1 AA, 2.4.5 Multiple Ways
- Recommendation: Add a mobile navigation pattern with a visible toggle button, keyboard support, and clear open/close state.
- Suggested command: `/i-adapt`

#### 2. Interactive elements have no visible keyboard focus design
- Location: `src/layouts/Layout.astro:160`, `src/components/Navigation.astro:70`, `src/components/Hero.astro:15`, `src/components/Footer.astro:66`, `src/components/Team.astro:74`
- Severity: High
- Category: Accessibility
- Description: Links and CTA controls define hover treatments, but there are no `:focus` or `:focus-visible` styles anywhere in the codebase.
- Impact: Keyboard users can tab through the page without a reliable indication of current focus, making the interface harder to operate and easier to mis-trigger.
- WCAG/Standard: WCAG 2.4.7 Focus Visible
- Recommendation: Add consistent, high-contrast focus-visible styles for all interactive elements, including nav links, CTA buttons, project cards, and footer links.
- Suggested command: `/i-harden`

### Medium-Severity Issues

#### 3. No `main` landmark for primary page content
- Location: `src/pages/index.astro:31`
- Severity: Medium
- Category: Accessibility
- Description: The page mounts navigation and all content directly inside the layout without a `<main>` wrapper.
- Impact: Screen reader users lose an important structural landmark and cannot jump directly to main content efficiently.
- WCAG/Standard: WCAG 1.3.1 Info and Relationships
- Recommendation: Wrap the page body content after navigation in a `<main id="main-content">` region and optionally add a skip link.
- Suggested command: `/i-harden`

#### 4. Scrollbars are globally hidden
- Location: `src/layouts/Layout.astro:121`
- Severity: Medium
- Category: Accessibility / Responsive
- Description: The stylesheet hides scrollbars on both `html` and `body` for all users.
- Impact: This removes a standard orientation cue, especially on desktop and trackpad-light environments, and makes long-page discoverability worse.
- WCAG/Standard: Usability issue; can impair orientation and discoverability
- Recommendation: Remove global scrollbar suppression or scope it to a deliberate custom-scroll region only.
- Suggested command: `/i-normalize`

#### 5. Hard-coded color values are mixed with tokens across the UI
- Location: `src/layouts/Layout.astro:34`, `src/layouts/Layout.astro:92`, `src/layouts/Layout.astro:239`, `src/components/Footer.astro:66`, `src/components/Projects.astro:87`, `src/components/Team.astro:56`
- Severity: Medium
- Category: Theming
- Description: The site defines useful root tokens, but many surfaces and text states still use direct hex and RGBA values instead of semantic variables.
- Impact: Theme updates become fragile, consistency drifts over time, and future dark mode or brand refresh work becomes more expensive.
- WCAG/Standard: Design-system maintainability issue
- Recommendation: Convert repeated direct colors into semantic tokens for link text, interactive states, overlays, border emphasis, and card fills.
- Suggested command: `/i-normalize`

#### 6. Hero composition uses a generic metric-card pattern
- Location: `src/components/Hero.astro:19`
- Severity: Medium
- Category: Anti-Patterns / Theming
- Description: The hero pairs a wordmark panel with three metric-like subcards, which closely matches the “hero metrics” template called out in the design guidance.
- Impact: The first impression feels interchangeable with AI-generated startup pages rather than tailored to the studio’s positioning.
- WCAG/Standard: N/A
- Recommendation: Replace the metric stack with a more distinctive proof-of-work, process, or capability presentation that reflects the studio’s voice.
- Suggested command: `/i-bolder`

### Low-Severity Issues

#### 7. Repeated glass/hover-lift card treatment flattens the page hierarchy
- Location: `src/layouts/Layout.astro:198`, `src/layouts/Layout.astro:205`, `src/components/Services.astro:33`, `src/components/About.astro:25`
- Severity: Low
- Category: Anti-Patterns / Theming
- Description: Panels, glass cards, and hover-lift treatments are reused broadly, producing a uniform “card everywhere” structure.
- Impact: Sections become less memorable, visual hierarchy weakens, and the site leans into a generic polished-SaaS look.
- WCAG/Standard: N/A
- Recommendation: Reserve elevated surfaces for moments that need emphasis and let other sections rely on typography, spacing, and composition instead.
- Suggested command: `/i-arrange`

#### 8. Brand assets are heavier than they need to be for decorative use
- Location: `public/assets/brand.png`, `public/assets/logo-text.png`, `public/assets/logo-icon.png`
- Severity: Low
- Category: Performance
- Description: Decorative brand images total roughly 394 KB before transfer optimizations, with the icon asset alone at about 166 KB.
- Impact: This is not catastrophic on a small site, but it adds avoidable transfer weight for first-time visits.
- WCAG/Standard: Performance optimization
- Recommendation: Replace PNG brand marks with SVG where possible or produce smaller responsive image variants for non-photographic assets.
- Suggested command: `/i-optimize`

## Patterns & Systemic Issues
- Repeated hard-coded accent colors bypass the existing token system and will make theming changes tedious.
- Interactive affordances are hover-first; keyboard and focus states are underdesigned throughout the site.
- The page composition relies too heavily on rounded panels and glass-like surfaces instead of stronger layout decisions.
- Mobile adaptation is incomplete: sections collapse, but navigation behavior does not.

## Positive Findings
- The page already respects reduced-motion preferences via `prefers-reduced-motion` in `src/layouts/Layout.astro:288`.
- Core content structure is straightforward and readable, with sensible section IDs and a simple information architecture.
- Layouts generally collapse to one column cleanly at smaller breakpoints.
- The team photo uses Astro image optimization instead of serving the raw JPEG directly.
- Build output is small and the static site compiles successfully with `npm run build`.

## Recommendations by Priority
1. Immediate
   - Restore mobile navigation with a real small-screen menu.
   - Add visible `:focus-visible` treatment to every interactive element.
   - Add a `<main>` landmark and ideally a skip link.
2. Short-term
   - Stop hiding global scrollbars.
   - Normalize the color system into semantic tokens.
   - Rework hero content away from the metric-card trope.
3. Medium-term
   - Reduce dependence on glass cards and repeated hover-lift interactions.
   - Tighten the visual system so sections feel more distinct from one another.
4. Long-term
   - Optimize brand assets into SVG or smaller variants.
   - Consider a stronger typographic or editorial direction to better differentiate the brand.

## Suggested Commands for Fixes
- Use `/i-adapt` to rebuild the mobile navigation and improve small-screen behavior.
- Use `/i-harden` to add focus states, landmarks, and stronger accessibility affordances.
- Use `/i-normalize` to convert hard-coded styling into tokenized, system-level decisions.
- Use `/i-bolder` to redesign the hero and remove generic startup composition.
- Use `/i-arrange` to reduce card repetition and improve layout hierarchy.
- Use `/i-optimize` to trim brand asset weight and review loading strategy.
