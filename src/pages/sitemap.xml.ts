import { getCollection } from "astro:content";
import type { APIRoute } from "astro";

export const GET: APIRoute = async ({ site }) => {
	const base = site ?? new URL("https://nyt87.github.io");
	const projects = (await getCollection("projects")).sort(
		(a, b) => a.data.order - b.data.order,
	);

	const urls = [
		{ loc: new URL("/", base).href, changefreq: "weekly", priority: "1.0" },
		{
			loc: new URL("/projects/", base).href,
			changefreq: "weekly",
			priority: "0.8",
		},
		{
			loc: new URL("/team/", base).href,
			changefreq: "monthly",
			priority: "0.6",
		},
		...projects.map((project) => ({
			loc: new URL(`/projects/${project.id}/`, base).href,
			changefreq: "monthly",
			priority: "0.7",
		})),
	];

	const body = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls
	.map(
		(url) => `  <url>
    <loc>${url.loc}</loc>
    <changefreq>${url.changefreq}</changefreq>
    <priority>${url.priority}</priority>
  </url>`,
	)
	.join("\n")}
</urlset>
`;

	return new Response(body, {
		headers: { "Content-Type": "application/xml; charset=utf-8" },
	});
};
