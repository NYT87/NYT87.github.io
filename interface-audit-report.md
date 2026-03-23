# Interface Audit Report

Project: `nyt87`
Date: 2026-03-23
Scope: Marketing site in `src/pages/index.astro`, `src/layouts/Layout.astro`, and `src/components/*.astro`

## Anti-Patterns Verdict
Fail. The site is cleaner than earlier iterations, but it still reads as AI-adjacent rather than unmistakably bespoke.

Specific tells:
- Floating glassy navigation with blur and soft shadow in [`src/components/Navigation.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Navigation.astro)
- Repeated rounded panel/card treatment across hero, about, services, projects, team, and footer
- Gradient-heavy dark theme and decorative radial background effects in [`src/layouts/Layout.astro`](/Users/josemiguel/workspace-personal/nyt87/src/layouts/Layout.astro)
- Service and project sections still rely on a familiar card-grid pattern rather than a more distinctive composition

This no longer looks like a generic SaaS template from top to bottom, but it still contains enough 2024-2025 AI landing-page fingerprints that most designers would not read it as fully original.

## Executive Summary
- Total issues: 8
- Critical: 0
- High: 3
- Medium: 3
- Low: 2
- Overall quality score: 7/10

Most critical issues:
1. Focus styling is still incomplete, making keyboard interaction weaker than it should be.
2. The site still relies on `overflow-x: hidden` at the shell level, which can mask responsive defects instead of resolving them.
3. The visual language remains too dependent on glass/panel treatments to feel truly formal and “engineering-grade.”
4. Hard-coded RGBA values still bypass the token system in multiple places.
5. The mobile menu behavior is functional but still fragile compared with a purpose-built menu button pattern.

Recommended next steps:
1. Harden keyboard and interaction states first.
2. Resolve responsive behavior without relying on page-level overflow suppression.
3. Normalize the remaining visual tokens and reduce card/glass repetition.
4. Recompose services/projects/footer for a more editorial, less templated feel.

## Detailed Findings by Severity

### Critical Issues
None.

### High-Severity Issues

#### 1. Visible focus styles are still not consistently implemented
- Location: [`src/layouts/Layout.astro`](/Users/josemiguel/workspace-personal/nyt87/src/layouts/Layout.astro), [`src/components/Navigation.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Navigation.astro), [`src/components/Hero.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Hero.astro)
- Severity: High
- Category: Accessibility
- Description: The current global styles include a skip link reveal, but there is no clear site-wide `:focus-visible` treatment for links, buttons, summary controls, or card links.
- Impact: Keyboard users can navigate, but focus location is not reliably obvious across the interface, which weakens confidence and usability.
- WCAG/Standard: WCAG 2.4.7 Focus Visible
- Recommendation: Reintroduce a strong tokenized `:focus-visible` system for all interactive elements, including nav links, menu trigger, hero CTAs, project cards, footer links, and external profile links.
- Suggested command: `/i-harden`

#### 2. Responsive behavior is still being protected by page-level overflow hiding
- Location: [`src/layouts/Layout.astro`](/Users/josemiguel/workspace-personal/nyt87/src/layouts/Layout.astro)
- Severity: High
- Category: Responsive
- Description: The page shell uses `overflow-x: hidden` on `html`, `body`, and `main`, which often indicates unresolved width problems are being clipped rather than solved structurally.
- Impact: Hidden overflow can conceal layout regressions and produce brittle behavior when text scales up, browser UI changes, or translated copy appears.
- WCAG/Standard: Responsive robustness / maintainability issue
- Recommendation: Audit the remaining layout widths and remove shell-level overflow suppression once every section fits naturally within the viewport.
- Suggested command: `/i-adapt`

#### 3. The design still leans too heavily on generic glass/panel styling
- Location: [`src/layouts/Layout.astro`](/Users/josemiguel/workspace-personal/nyt87/src/layouts/Layout.astro), [`src/components/About.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/About.astro), [`src/components/Services.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Services.astro), [`src/components/Projects.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Projects.astro)
- Severity: High
- Category: Anti-Patterns / Theming
- Description: The site uses rounded panels and glass-like surfaces as the primary design device across most sections.
- Impact: This weakens the “formal, geeky, smart” positioning and keeps the site in familiar AI-landing-page territory instead of making it feel like a distinctive engineering studio.
- WCAG/Standard: N/A
- Recommendation: Reduce the number of framed surfaces and let typography, alignment, spacing rhythm, and information structure carry more of the design.
- Suggested command: `/i-bolder`

### Medium-Severity Issues

#### 4. Token usage is still inconsistent
- Location: [`src/layouts/Layout.astro`](/Users/josemiguel/workspace-personal/nyt87/src/layouts/Layout.astro), [`src/components/About.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/About.astro), [`src/components/Hero.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Hero.astro)
- Severity: Medium
- Category: Theming
- Description: The base token system is better than before, but several key effects still use direct `rgba(...)` values for gradients, shadows, and decorative highlights.
- Impact: This makes the theme feel less disciplined and harder to evolve consistently across light and dark modes.
- WCAG/Standard: Design-system maintainability issue
- Recommendation: Convert the remaining hard-coded translucency and decorative color values into semantic tokens.
- Suggested command: `/i-normalize`

#### 5. Mobile menu interaction is workable but not fully hardened
- Location: [`src/components/Navigation.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Navigation.astro)
- Severity: Medium
- Category: Accessibility / Responsive
- Description: The mobile menu uses native `details/summary`, which is lightweight, but the behavior still depends on a fairly customized visual treatment and has been fragile through several iterations.
- Impact: Small alignment or browser-default differences can reintroduce visual defects, and the interaction model is less explicit than a dedicated button + menu pattern.
- WCAG/Standard: Interaction robustness issue
- Recommendation: Either fully harden the `details/summary` approach across browsers with stronger state styling, or replace it with a proper button-driven mobile menu.
- Suggested command: `/i-harden`

#### 6. Information sections still flatten into a repeated card rhythm
- Location: [`src/components/Services.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Services.astro), [`src/components/Projects.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Projects.astro), [`src/components/About.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/About.astro)
- Severity: Medium
- Category: Composition / Responsive
- Description: Several sections use the same “title, panel, panel, panel” cadence with similar spacing and border treatment.
- Impact: The page feels more assembled than directed, which reduces memorability and makes the content hierarchy flatter than it should be.
- WCAG/Standard: N/A
- Recommendation: Give each section a clearer structural identity, especially services and projects, instead of repeating the same surface logic.
- Suggested command: `/i-arrange`

### Low-Severity Issues

#### 7. Decorative brand PNGs are still heavier than necessary
- Location: [`public/assets/brand.png`](/Users/josemiguel/workspace-personal/nyt87/public/assets/brand.png), [`public/assets/brand-dark.png`](/Users/josemiguel/workspace-personal/nyt87/public/assets/brand-dark.png), [`public/assets/logo-text.png`](/Users/josemiguel/workspace-personal/nyt87/public/assets/logo-text.png), [`public/assets/logo-text-white.png`](/Users/josemiguel/workspace-personal/nyt87/public/assets/logo-text-white.png)
- Severity: Low
- Category: Performance
- Description: The site still depends on PNG assets for brand marks that could likely be served more efficiently as SVG.
- Impact: This adds unnecessary transfer cost for decorative assets, especially on first load.
- WCAG/Standard: Performance optimization
- Recommendation: Convert logo assets to SVG or produce smaller variants for non-photographic brand marks.
- Suggested command: `/i-optimize`

#### 8. Some decorative motion and glow remain more stylish than purposeful
- Location: [`src/layouts/Layout.astro`](/Users/josemiguel/workspace-personal/nyt87/src/layouts/Layout.astro), [`src/components/Hero.astro`](/Users/josemiguel/workspace-personal/nyt87/src/components/Hero.astro)
- Severity: Low
- Category: Anti-Patterns / Theming
- Description: Background radial effects and hover-lift treatments still contribute more atmosphere than information.
- Impact: This is not harmful on its own, but it slightly undermines the “quietly confident” direction.
- WCAG/Standard: N/A
- Recommendation: Trim decorative effects that do not reinforce hierarchy or meaning.
- Suggested command: `/i-quieter`

## Patterns & Systemic Issues
- Rounded card and panel treatments are still the dominant visual device throughout the site.
- Remaining hard-coded translucent colors weaken the token system.
- Responsive fixes have improved but are not fully structural yet because the shell still hides overflow.
- The current design is strongest in the hero and weakest in the repeated mid-page sections, where the layout feels most templated.

## Positive Findings
- The site now has a valid `main` landmark and a skip link, which is an improvement over the earlier version.
- The mobile navigation exists and includes a real small-screen trigger instead of simply disappearing.
- Dark-theme logo variants are implemented, which improves brand legibility in dark mode.
- The hero is stronger than before: it now communicates operating style rather than relying entirely on generic metrics.
- The site respects reduced motion through `prefers-reduced-motion`.
- `npm run build` succeeds and the static Astro output remains lightweight.

## Recommendations by Priority
1. Immediate
   - Restore strong site-wide focus-visible styles.
   - Remove the need for shell-level horizontal overflow hiding by fixing the remaining width assumptions.
   - Stabilize the mobile menu interaction pattern.
2. Short-term
   - Reduce the repeated panel/glass treatment across sections.
   - Normalize all remaining hard-coded translucent colors into semantic tokens.
   - Rework services/projects composition so sections feel more differentiated.
3. Medium-term
   - Simplify decorative background effects and hover treatments.
   - Strengthen the typographic identity so the site feels more editorial and less product-marketing driven.
4. Long-term
   - Replace PNG brand marks with SVG.
   - Revisit the overall art direction once the responsive/accessibility foundations are fully stable.

## Suggested Commands for Fixes
- Use `/i-harden` to address focus states, interaction states, and mobile menu robustness.
- Use `/i-adapt` to resolve responsive behavior without relying on `overflow-x: hidden`.
- Use `/i-normalize` to finish tokenizing color/effect values and align system styling.
- Use `/i-arrange` to reduce section repetition and improve layout identity.
- Use `/i-bolder` to move the overall look further away from generic AI-era glass/card aesthetics.
- Use `/i-optimize` to replace or reduce heavy PNG brand assets.
