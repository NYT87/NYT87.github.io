---
name: "Agents PP"
kind: "Open source · Claude Code plugin"
summary: "Pair-programming workflows for coding agents: one agent codes while an independent reviewer comments, looping until every comment is resolved."
repoUrl: "https://github.com/NYT87/agents-pp"
repoHost: "GitHub"
status: "Available, actively developed"
license: "MIT"
stack: ["Claude Code plugin", "Shell", "Codex / Claude backends"]
order: 5
---

## Overview

Agents PP, short for Agents Pair Programming, is a collection of pair-programming workflows for coding agents. Two agents share one task: one codes, the other reviews, until the reviewer has no comments left.

The first workflow, review-loop, is a Claude Code skill and plugin that turns any task into a coder and reviewer loop. It was inspired by the single-round review loops people were running by hand, and makes them multi-round, backend-agnostic and auditable.

## What it does

- **A coder and an independent reviewer.** Claude implements the task. A separate CLI agent, Codex or another Claude, reads the diff and writes numbered comments with a verdict.
- **Every comment answered by ID.** The coder fixes each comment or declines it with a reason, then resubmits. The loop repeats until the reviewer approves with no blocking comments, the round cap is reached, or you cancel.
- **An auditable trail.** Every round is written to disk, so each agent reads the other's output from a file and the whole conversation can be reviewed afterwards.
- **Enforced, not optional.** Installed as a plugin, a Stop hook keeps the coder from ending its turn while a loop is active, so the review actually happens.
- **Role presets.** Ready-made focus instructions such as senior architect, senior backend, QA, DevOps or security can be given to either agent, so the coder builds to a standard and the reviewer checks against it.
- **Configurable and observable.** Backend, model, effort and round caps are set per run or per project. A status command, a continue command for loops that hit their cap, opt-in usage tracking and a dashboard show what each round cost and decided.

## How it is built

The plugin is a set of Claude Code skills backed by shell scripts. A reviewer backend is a small script that runs a CLI agent with the rendered prompt and writes its final message atomically, so partial output is never installed. Backends can expose their model catalog so the configuration wizard and dashboard offer valid models and effort levels. State lives in a per-loop directory in the project, which is what makes continuing, cancelling and auditing a loop possible.

## Status

Agents PP is available now under the MIT license, installable as a Claude Code plugin from the repository's marketplace or as standalone skills. The roadmap includes an opencode reviewer backend and more pair-programming workflows.
