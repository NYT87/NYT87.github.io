---
name: "Bongsu"
kind: "Open source · Self-hosted · Web app"
summary: "A self-hosted publishing scheduler for creators: Instagram and YouTube Shorts in one queue, where agents can plan but only you approve and publish."
liveUrl: "https://nyt87.gitlab.io/bongsu/"
liveKind: "site"
liveLabel: "Project site"
repoUrl: "https://gitlab.com/nyt87/bongsu"
repoHost: "GitLab"
status: "Early development"
license: "MIT"
stack: ["TypeScript", "Cloudflare Workers", "D1 / SQLite / Postgres", "Docker", "MCP", "REST API"]
order: 4
---

## Overview

Bongsu is a self-hosted publishing scheduler for creators. You approve a post once, and it goes out on time on every channel it is planned for: Instagram Reels, posts, carousels, stories and Trial Reels, plus YouTube Shorts comments, all in one queue.

The name comes from the Joseon-era beacon towers of Korea (봉수, 烽燧). A signal lit on one mountain peak was caught by the next and passed along the chain. Bongsu works the same way: you light the signal once, and it travels to every channel on schedule.

## What it does

- **Approval with your passkey.** Before anything is published you see exactly what goes out: media, caption, alt text, comment, account and time. If the text or media changes after approval, the post waits for you again.
- **Publishes without your computer on.** Bongsu runs on your own Cloudflare account, within the free plan, and posts on schedule while you are away from your desk or asleep.
- **Built for agents, with you in charge.** A built-in MCP server and REST API let an agent such as Claude read the queue, write captions, add items and propose drafts. Agent keys cannot approve, resume or publish. Only your passkey can.
- **The daily work, on your phone.** An installable app shows what goes out today and what needs you, with Today, Calendar, Queue and Drafts views in the workspace's time zone. When nothing needs you, it stays quiet.
- **Notifications and inbox.** Push and ntfy notifications with approve buttons, a daily digest, and a Google Drive inbox where dropped files become drafts ready to schedule.
- **Caption checks.** Length, the fold, the hashtag cap, a single call to action and invisible characters are checked before posting. Any item can be held, and everything can be paused until you resume.
- **Watchtower.** Results after 24 hours, new comments and a stats page close the loop on every post.

## How it is built

Bongsu runs on Cloudflare Workers with D1, or in Docker on your own server with SQLite or Postgres. The agent surface is an MCP server and a REST API with scoped keys, so planning can be delegated while publishing stays behind the owner's passkey. It can be tried locally first with demo accounts and nothing real behind them.

## Status

Bongsu is in early development under the MIT license and is not yet deployed. The project site, source and roadmap live on GitLab for now.
