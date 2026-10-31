---
name: "Drift"
role: "contribution"
kind: "Open source contribution · Desktop app"
summary: "Ongoing contributions to CutWire Drift, a free, open-source desktop video editor: media bin, start screen, agent access over MCP, lossless rotation and timeline tools."
liveUrl: "https://cutwire.org/drift"
liveLabel: "cutwire.org/drift"
repoUrl: "https://github.com/CutWire-Studios/Drift"
repoHost: "GitHub"
links:
  - label: "Merged pull requests"
    url: "https://github.com/CutWire-Studios/Drift/pulls?q=is%3Apr+author%3Ajmn8718+is%3Amerged"
status: "Active contributor since August 2026"
license: "GPL-3.0 (upstream)"
stack: ["C++", "Qt 6", "FFmpeg", "MCP"]
order: 6
---

## Overview

Drift, by CutWire Studios, is a free, open-source, beginner-friendly desktop video editor built with Qt 6 and FFmpeg. It runs on Linux, Windows, macOS and Android, has no account, no watermark and no subscription, and can be driven by an agent over MCP as well as by hand.

NYT87 contributes to Drift as an open-source contributor. Since August 2026, 25 pull requests from the studio have been merged upstream, with more in review. The work is listed under the GitHub handle jmn8718.

## What we contributed

- **Media bin.** Folders, multi-select and range selection, moving folders into folders with cycle guards, and an Import Folder action that mirrors a directory's structure into the bin.
- **Start screen.** A start screen for picking or starting a project on launch, reachable settings, debug info and agent access without an open project, and the fix that keeps it behind the first-run language screen.
- **Agent access over MCP.** Skipping the layout chooser for agent-created projects, closing projects and export dialogs from the agent, an option to start agent access on launch, and crop and rotation tools for agents.
- **Clips and framing.** Lossless video rotation from the bin and on the timeline, non-destructive source framing for video clips, track renaming, timeline close-gap and per-clip split actions, and a full-project timeline overview strip.
- **Playback and robustness.** Pausing background decoding during playback with a 1/8 preview quality, reclaiming idle decoder workers, re-probing media rewritten in place, multiple instances, and fixes for addon installs, native file dialogs on unsandboxed Linux, swscale warnings and stabilize-state notifications.

## Why we contribute

Drift is the kind of software the studio likes to build: a real desktop application with performance constraints, a native UI and a growing agent interface. Contributing upstream keeps the team sharp on C++ and Qt work and gives something back to a tool people actually use.
