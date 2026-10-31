# NYT87 — Company Website

Official website for **NYT87**, a remote software development company. Built with [Astro](https://astro.build) and deployed to [NYT87.github.io](https://NYT87.github.io).

## About

NYT87 helps companies build robust IT projects and contribute to the open-source community. We specialize in:

- **Web Applications** — Dynamic, responsive frontend experiences
- **Backend Applications** — Scalable APIs and server-side systems
- **Infrastructure** — Cloud-native solutions and CI/CD pipelines

## Tech Stack

- **Framework:** [Astro](https://astro.build) (Static Site Generation)
- **Styling:** Vanilla CSS with Glassmorphism design
- **Fonts:** [Outfit](https://fonts.google.com/specimen/Outfit) & [Inter](https://fonts.google.com/specimen/Inter) (Google Fonts)
- **Formatter:** [Biome](https://biomejs.dev) (JS/TS) + [Prettier](https://prettier.io) (Astro files)
- **Deployment:** GitHub Pages via GitHub Actions

## Project Structure

```
/
├── .github/
│   └── workflows/
│       └── deploy.yml       # CI/CD — deploys to GitHub Pages on push to main
├── public/
│   └── assets/              # Static images (logo, brand, etc.)
├── src/
│   ├── assets/              # Astro-optimized images (e.g. team photos)
│   ├── components/          # Reusable Astro components
│   │   ├── Navigation.astro
│   │   ├── Hero.astro
│   │   ├── Services.astro
│   │   ├── Projects.astro   # Work section, read from the projects collection
│   │   ├── WorkList.astro   # Shared project rows (homepage + /projects/)
│   │   ├── Approach.astro
│   │   ├── Team.astro
│   │   ├── Contact.astro
│   │   └── Footer.astro
│   ├── content/
│   │   ├── projects/        # One Markdown file per project (frontmatter + long description)
│   │   └── team/            # One Markdown file per team member
│   ├── content.config.ts    # Content collection schema
│   ├── layouts/
│   │   └── Layout.astro     # Global layout, fonts, and base styles
│   └── pages/
│       ├── index.astro      # Homepage
│       ├── 404.astro        # Not-found page, redirects to the homepage
│       ├── projects/
│       │   ├── index.astro  # All projects, grouped by role
│       │   └── [slug].astro # One page per project, generated from src/content/projects
│       ├── team.astro       # Team page, generated from src/content/team
│       └── sitemap.xml.ts   # Generated sitemap (all pages)
├── biome.json               # Biome config
├── .prettierrc              # Prettier config (Astro plugin)
└── package.json
```

## Adding a project

Add a Markdown file to `src/content/projects/`. The frontmatter (`name`, `role`, `kind`, `summary`,
`liveUrl`, `liveKind`, `liveLabel`, `repoUrl`, `repoHost`, `links`, `status`, `license`, `stack`, `order`) feeds the Work list on
the homepage and the header of the project page; the body is the project page's long
description. `role` is `studio` (default), `client` or `contribution`; `liveKind` is `app` (default) when `liveUrl` opens the running
product or `site` when it is a project website; `repoUrl` is optional for client work with a
private codebase. The file name becomes the URL: `bongsu.md` → `/projects/bongsu/`.

## Commands

All commands are run from the root of the project:

| Command | Action |
| :--- | :--- |
| `npm install` | Install dependencies |
| `npm run dev` | Start local dev server at `localhost:4321` |
| `npm run build` | Build production site to `./dist/` |
| `npm run preview` | Preview production build locally |
| `npm run format` | Format all files (Biome + Prettier) |
| `npm run lint` | Lint and auto-fix with Biome |
| `npm run check` | Run full format + lint check |

## Deployment

The site is automatically deployed to [NYT87.github.io](https://NYT87.github.io) on every push to `main` via GitHub Actions.

To enable deployment, go to **Settings → Pages** and set the source to **GitHub Actions**.

## Contact

📧 [nyt87@proton.me](mailto:nyt87@proton.me)  
🐙 [github.com/NYT87](https://github.com/NYT87)
