---
name: Website Design
description: Best practices and guidelines for building premium, modern dynamic web applications
---

# Website Design Skill

This skill provides guidelines and best practices for creating stunning, modern, and high-quality web applications.

## Technology Stack
1. **Core**: Use HTML for structure and Javascript for logic.
2. **Styling (CSS)**: Use Vanilla CSS for maximum flexibility and control. Avoid using TailwindCSS unless explicitly requested; in this case, confirm which TailwindCSS version to use.
3. **Web App Frameworks**: For complex web apps, use a framework like Next.js or Vite (only if explicitly requested).
4. **New Project Creation**: 
   - Use `npx -y` to auto-install the script and dependencies.
   - Run the command with `--help` to see all options first.
   - Initialize in the current directory with `./` (e.g., `npx -y create-vite-app@latest ./`).
   - Run in non-interactive mode.
5. **Running Locally**: Use `npm run dev` or equivalent. Do not build for output unless explicitly requested or needed for validation.

## Design Aesthetics
1. **Rich Aesthetics**: The design must WOW at first glance. Use modern best practices (vibrant colors, dark mode, glassmorphism, dynamic animations).
2. **Visual Excellence**:
   - Avoid generic colors (e.g., plain red/blue/green). Use curated palettes like HSL tailored colors or sleek dark modes.
   - Use modern typography (Google Fonts: Inter, Roboto, Outfit) instead of browser defaults.
   - Use smooth gradients.
   - Add subtle micro-animations for UX.
3. **Dynamic Design**: Interface should feel responsive and alive. Use hover effects, interactive elements, and micro-animations.
4. **Premium Feel**: Avoid simple, basic MVPs. Aim for state-of-the-art feel.
5. **No Placeholders**: When an image is needed, use the `generate_image` tool instead of placeholders.

## Implementation Workflow
1. **Plan & Understand**: Understand user requirements, draw inspiration, and outline needed features.
2. **Build Foundation**: Start by modifying `index.css`. Implement the core design system (tokens, utilities).
3. **Create Components**: Build components using the predefined design system styles.
4. **Assemble Pages**: Incorporate design/components into the main application, routing, and responsive layout.
5. **Polish & Optimize**: Review UX, ensure smooth interactions/transitions, optimize performance.

## SEO Best Practices
- **Title Tags**: Descriptive title tags for each page.
- **Meta Descriptions**: Compelling summaries.
- **Heading Structure**: Single `<h1>` per page, proper hierarchy.
- **Semantic HTML**: Use HTML5 semantic elements.
- **Unique IDs**: ID interactive elements uniquely for browser testing.
- **Performance**: Optimize for fast page loads.
