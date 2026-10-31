---
name: "Booba Pass"
kind: "Open source · Web app · PWA"
summary: "A centralized wallet for airline loyalty information with QR and barcode support, designed for quick access and practical day-to-day use."
liveUrl: "https://nyt87.github.io/booba-pass/"
repoUrl: "https://github.com/NYT87/booba-pass"
repoHost: "GitHub"
status: "Live, actively maintained"
license: "Open source"
stack: ["React", "TypeScript", "Vite", "Dexie (IndexedDB)", "Leaflet", "Cloudflare Workers"]
order: 2
---

## Overview

Booba Pass is a fully local, offline-first progressive web application for tracking, analyzing and storing your flight history, loyalty memberships and digital boarding passes. It is installed on the phone like a native app and keeps everything on the device: there is no account, no server-side database and nothing to sync.

It started as a practical answer to a small, recurring annoyance. Frequent-flyer numbers, membership cards and boarding passes end up scattered across airline apps, emails and screenshots. Booba Pass puts them in one place, shows the right barcode at the gate and keeps a record of every flight taken.

## What it does

- **Flight history.** Log flights with airline, route, dates and seat, group them into trips, and browse the full record by trip or by flight.
- **Loyalty memberships.** Store each programme's number and tier, render it as a scannable QR code or barcode, and track mileage balances per membership.
- **Stats and map.** Aggregate the history into totals and per-airline statistics, and draw every route on a world map.
- **Offline first.** All data lives in the browser's IndexedDB. The app works in flight mode and after the tab is closed, and it can be exported and imported as a file for backups or moving between devices.
- **Mobile-first.** A bottom navigation, haptic feedback and a light and dark theme make it feel like the native apps it replaces.

## How it is built

The repository is an npm-workspaces monorepo with two apps. The web app is a React and TypeScript PWA built with Vite, using Dexie over IndexedDB for storage, Leaflet for the route map and Recharts for statistics. A small Cloudflare Worker acts as a proxy for external tracking data where browsers would otherwise be blocked by CORS or restrictive server policies, so the client never needs its own backend.

Each app is versioned independently with Release Please. The web app is deployed to GitHub Pages and the worker to Cloudflare Workers, each only when its own release is cut, so a frontend change never forces a backend deploy.

## Status

Booba Pass is live and in daily use. Work continues on the tracking integrations and on the statistics views.
