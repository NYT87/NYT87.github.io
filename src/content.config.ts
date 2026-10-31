import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const projects = defineCollection({
	loader: glob({ pattern: "**/*.md", base: "./src/content/projects" }),
	schema: z.object({
		name: z.string(),
		/** Studio project, client engagement, or contribution to someone else's project */
		role: z.enum(["studio", "client", "contribution"]).default("studio"),
		kind: z.string(),
		summary: z.string(),
		liveUrl: z.string().url().optional(),
		/** "app": liveUrl opens the running product; "site": it is a project or product website */
		liveKind: z.enum(["app", "site"]).default("app"),
		liveLabel: z.string().default("Website"),
		repoUrl: z.string().url().optional(),
		repoHost: z.enum(["GitHub", "GitLab"]).optional(),
		links: z
			.array(z.object({ label: z.string(), url: z.string().url() }))
			.default([]),
		status: z.string(),
		license: z.string(),
		stack: z.array(z.string()),
		order: z.number().int(),
	}),
});

const team = defineCollection({
	loader: glob({ pattern: "**/*.md", base: "./src/content/team" }),
	schema: ({ image }) =>
		z.object({
			name: z.string(),
			fullName: z.string(),
			title: z.string(),
			photo: image(),
			summary: z.string(),
			location: z.string().optional(),
			focus: z.array(z.string()),
			links: z
				.array(z.object({ label: z.string(), url: z.string().url() }))
				.default([]),
			order: z.number().int(),
		}),
});

export const collections = { projects, team };
