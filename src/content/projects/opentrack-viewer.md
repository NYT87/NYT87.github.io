---
name: "OpenTrack Viewer"
kind: "Open source · Web app · PWA"
summary: "A privacy-first, client-side web app and PWA for viewing activity tracking files, with everything processed locally in the browser."
liveUrl: "https://nyt87.github.io/opentrack-viewer/"
repoUrl: "https://github.com/NYT87/opentrack-viewer"
repoHost: "GitHub"
status: "Live, actively developed"
license: "Open source"
stack: ["React", "TypeScript", "Vite", "MapLibre GL", "Vitest", "Playwright"]
order: 3
---

## Overview

OpenTrack Viewer opens activity files from sports watches, bike computers and action cameras directly in the browser. Drop in a GPX, FIT, TCX or KML file and you get the route on a map, the summary statistics and an elevation profile, all computed in the tab you are looking at.

There is no server, no account and no activity database. The file never leaves the device. That is the whole point of the project: most activity tools ask you to upload your tracks to someone else's platform before you can look at them, and OpenTrack Viewer exists so you do not have to.

## What it does

- **Four formats in, three out.** Reads GPX, FIT, TCX and KML, and exports GPX, FIT and TCX from any of them, so a file from one ecosystem can be moved to another.
- **Map and charts, synchronized.** Hovering a point on the elevation, speed or pace chart highlights it on the route, and the other way round. Charts switch between distance and time on the x-axis, and running activities get pace-specific views.
- **GoPro telemetry.** Reads the GPS track embedded in GoPro videos, plus the acceleration, rotation and temperature streams the camera recorded, and turns them into a normal activity. A video overlay tool is in progress.
- **Privacy that is enforced, not promised.** Parsing uses only browser file APIs with no network access reachable from that path. The map is not even created until a route is open, and basemap tiles can be switched off so nothing is requested from any external server. Browser tests fail if a file load issues any request carrying coordinates or the file name.
- **Installable PWA.** Works offline once installed, with theme and basemap preferences remembered on the device.

## How it is built

The architecture is a pipeline: file intake, format detection, a parser registry, and a normalized activity model that the stats engine, the map adapter and the chart adapter all consume. The rule that keeps it maintainable is that the UI depends on the normalized model and never on parser output. Supporting a new format means adding one parser; nothing downstream changes.

The app is React and TypeScript on Vite, with MapLibre GL for the map, loaded lazily only when there is a route to draw. Unit and component tests run on Vitest, browser tests on Playwright, and CI runs lint, type checks and both suites on every push before deploying to GitHub Pages.

## Status

The core viewer, all four import formats, the export paths and the GoPro telemetry reader are complete. Current work is the telemetry video overlay tool. Known limits are documented in the repository, including large-file parsing on the main thread and the absence of KML export.
