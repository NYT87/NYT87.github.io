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
│   │   ├── About.astro
│   │   ├── Services.astro
│   │   ├── Projects.astro
│   │   ├── Team.astro
│   │   └── Footer.astro
│   ├── layouts/
│   │   └── Layout.astro     # Global layout, fonts, and base styles
│   └── pages/
│       └── index.astro      # Page entry point
├── biome.json               # Biome config
├── .prettierrc              # Prettier config (Astro plugin)
└── package.json
```

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
