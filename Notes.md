- From project root (current directory)
- `npm create svelte@latest {APP_NAME}`
- Allow (y) package to install create-svelte@{VERSION_NUMBER}
- Select "Skeleton project"
- Select "Yes, using TypeScript syntax"
- Skip [ESLint, Prettier, Playwright, Vitest]
- `npm i`
- `npm run dev`
- Open http://localhost:5173
- `^C`
- Install "Svelte for VS Code" VS Code extension
> Use Control-Shift-P to access the VS Code command palette.
> Type "SvelteKit" to find options for creating SvelteKit files in the ./src/routes/ directory with auto-generated boilerplate code.
- VSCode: Install "Thunder Client" VS Code extension
### Firebase Client Setup
- Firebase: Create a Firebase project (Add a {NAME} and select NO for Google Analytics)
- Firebase: Enable Authenication and add Google as a provider
- Firebase: Enable Firestore Database and start in Production mode
- Firebase: Enable a Storage bucket and start in Production mode
- Firebase: Add an App to the project
- `npm i firebase`
- Paste Firebase config to `fkit/src/lib/firebase.ts`
- `echo "/src/lib/firebase.ts" >> ./.gitignore`
### Firebase Admin Setup
- `mkdir -p src/lib/server/`
- `touch src/lib/server/admin.ts`
- `echo "src/lib/server/admin.ts" >> ./.gitignore`
- `npm i firebase-admin`
- Download `service-account.json` (Firebase -> Project settings -> Service accounts) to project root
- `touch ./.env`
- Create environment variables in `.env` for `[FB_PROJECT_ID=project_id, FB_CLIENT_EMAIL=client_email, FB_PRIVATE_KEY=private_key]`
- Write code for `fkit/src/lib/server/admin.ts`
### Setup Tailwind and DaisyUI
- `npm install -D tailwindcss postcss autoprefixer`
- `npx tailwindcss init -p`
- In `./tailwind.config.js` add `content: ['./src/**/*.{html,js,svelte,ts'],`
- `touch src/app.css`
- `echo "@tailwind base;" >> ./src/app.css`
- `echo "@tailwind components;" >> ./src/app.css`
- `echo "@tailwind utilities;" >> ./src/app.css`
- Create SvelteKit file `./src/routes/+layout.svelte`
- Add `import "../app.css"` to `./src/routes/+layout.svelte` script
- Add a `<slot />` in the body of the component
- VSCode: Install "Tailwind CSS Intellisense" VS Code extension
- `npm i -D daisyui@latest`
- In `./tailwind.config.js` add `plugins: [require("daisyui")],`
> At this point, the project is configured for Svelte+SvelteKit (with TypeScript syntax), Firebase (Client and Admin) and Tailwind CSS (with DaisyUI plugin). The following steps are for building *this* specific application contained within the repository.
### Setup User Management
- Create routes `[routes/login/+page.svelte, routes/login/+layout.svelte, routes/login/photo/+page.svelte, routes/login/photo/+page.svelte]`
- Remove data fetching boilerplate code from each `*/+page.svelte` file (leaving only `<script lang="ts"> </script>`)

#### I stopped taking complete notes and just started building from this point onwards.

- Code `./src/routes/login/+layout.svelte` file
- Add `./src/lib/components/` directory
- Create `./src/lib/components/AnimatedRoute.svelte`
- Import `AnimatedRoute` component to `src/routes/login/+layout.svelte`
- Apply `AnimatedRoute` to `<main>`
- Oauth stuff
- Svelte store thing
- Make AuthCheck component
- Firebase: Create collections
- Firebase: Setup security
- Code atomic writing for users/usernames
- Add stylized validation
- Create [docStore, UserData, userData] in `/src/lib/firebase.ts`
- Add to `/src/routes/login/username/+page.svelte` using [docStore, UserData, userData]
