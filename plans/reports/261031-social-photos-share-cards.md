# Social Photos Design Report: NYT87 share cards

## Overview

- Requirements: share images for the NYT87 site and its social surfaces, in the brand's
  editorial-technical style, generated from the site's own data so new projects get a card
  without manual design work.
- Platforms: Open Graph (site, projects index, team page and each project page), GitHub social
  preview, LinkedIn banner.
- Variations: one concept ("Index card"), nine outputs.
- Style: minimalist editorial, light theme only (share images are shown on white or neutral
  feed backgrounds, where the parchment card reads as paper).

## Ideas Generated

1. **Index card** (chosen): parchment background, mono section label top-left with an orange
   index number, Space Grotesk headline, body summary, hairline rule, logo mark and wordmark
   bottom-left, canonical URL bottom-right. Reads as a section of the site.
2. **Spec sheet**: dark graphite with an "At a glance" spec list beside the title. More
   technical; rejected in favour of consistency with the light site.
3. **Signal rule**: thick vertical orange rule carrying the section index. Bolder; rejected as
   louder than the brand brief asks for.

## Design Decisions

- Color palette: `--bg` #FAF4EE, `--text` #191511, `--muted` #5E574F, `--line-strong`
  #B1A9A2, one accent `--brand-text` #B34200 for the index number and the slash. Same oklch
  values as the site tokens. No gradients, no glass, per the brand brief.
- Typography: Space Grotesk 500 for titles (112px on project cards, 64px for the studio
  headline, 54px on the banner), Manrope for summaries (26–30px), JetBrains Mono uppercase for
  labels (22px) and the URL (20px). All above the reference's minimum sizes at 1200px.
- Layout: 64px padding, a 2px rule at the top aligned to the content edges (as every site
  section opens), three rows (label, content, footer), footer separated by a 1px rule. The
  LinkedIn banner uses the same structure with tighter rhythm and smaller type.
- Brand alignment: copy is the site's own copy (homepage hero, project summaries, kind tags);
  no invented claims. The studio headline uses a non-breaking hyphen in "real‑world" as the
  site does.
- Implementation: cards are Astro pages at `/og/<card>/` (`src/pages/og/[card].astro`) built
  from the projects collection, screenshotted by `scripts/og-export.sh` (Chrome headless,
  exact pixel size, 6s virtual time for fonts) via `npm run og`. The `/og/` pages are
  `noindex`, excluded from the sitemap and disallowed in robots.txt.

## Output Files

| File | Size | Platform | Preview |
|------|------|----------|---------|
| public/assets/og/site.png | 1200×630 | Open Graph default (homepage, /projects/, /team/) | Studio headline and lead |
| public/assets/og/criptan.png | 1200×630 | Open Graph, /projects/criptan/ | "01 Work / Client · Fintech · Mobile app" |
| public/assets/og/booba-pass.png | 1200×630 | Open Graph, /projects/booba-pass/ | "02 Work / Open source · Web app · PWA" |
| public/assets/og/opentrack-viewer.png | 1200×630 | Open Graph, /projects/opentrack-viewer/ | "03 Work / Open source · Web app · PWA" |
| public/assets/og/bongsu.png | 1200×630 | Open Graph, /projects/bongsu/ | "04 Work / Open source · Self-hosted · Web app" |
| public/assets/og/agents-pp.png | 1200×630 | Open Graph, /projects/agents-pp/ | "05 Work / Open source · Claude Code plugin" |
| public/assets/og/drift.png | 1200×630 | Open Graph, /projects/drift/ | "06 Work / Open source contribution · Desktop app" |
| public/assets/og/github.png | 1280×640 | GitHub social preview (org and repos) | Studio headline, github.com/NYT87 |
| public/assets/og/linkedin.png | 1584×396 | LinkedIn profile or page banner | Studio headline, one-line lead |

## Why This Works

- Open Graph previews are read at thumbnail size: one headline, one label, one logo, high
  contrast (16.6:1 title, 6.5:1 summary), nothing in the outer 5% that crops differently per
  platform.
- The cards look like the page they link to, so the click lands somewhere that matches.
- Per-project cards carry the project's own index and tag, which distinguishes six otherwise
  similar links in a feed.
- Generated from content, so the set cannot drift from the site copy.

## Recommendations

- Upload `github.png` in GitHub → Organization settings → Social preview, and per repo for
  the public projects.
- Upload `linkedin.png` as the LinkedIn cover; LinkedIn crops the top and bottom on mobile,
  and the layout keeps the headline inside the central band.
- After editing any project summary, run `npm run og` and commit the regenerated PNGs; the
  export is not part of the CI deploy because it needs a browser.
- Validate the live tags once deployed with the LinkedIn Post Inspector and
  opengraph.xyz; cached previews may need a re-scrape.
