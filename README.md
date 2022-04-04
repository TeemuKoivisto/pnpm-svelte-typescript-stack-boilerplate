# [pnpm + Svelte + TypeScript boilerplate](https://github.com/TeemuKoivisto/pnpm-svelte-typescript-stack-boilerplate)

Monorepo boilerplate that I use, transformed into its own template repository.

Includes working CI pipeline with Github actions to Heroku, AWS S3+CloudFront, Github pages and Netlify - pick what suits you the best.

## How to run locally

You must have `pnpm` installed globally: `npm i -g pnpm`. Then Docker and Postgres to access deployed Heroku DB instance.

1. Install all dependencies: `pnpm i`
2. Start the database: `docker-compose up -d postgres`
3. Copy the environment variables: `cp ./packages/api/.env-example ./packages/api/.env && cp ./packages/client/.env-example ./packages/client/.env && cp ./packages/db/.env-example ./packages/db/.env`
4. Migrate the database: `pnpm run migrate --filter @myapp/db`
5. And seed it with test data: `pnpm run seed --filter @myapp/db`
6. Start the app in http://localhost:5909: `pnpm start`

## Commands

`pnpm` is a package manager that uses linking to reduce installation times.

It's pretty cool _but_ sometimes the linking might get funky, eg you remove a package from `packages/` and the links might not work anymore even after doing `pnpm i`. In that case trusty ol `rm -rf ./**/node_modules && pnpm i` helps.

* Install packages with: `pnpm add jsonwebtoken --filter @myapp/api`.
* To install as devDependency use -D: `pnpm add -D rollup-svelte-plugin --filter @myapp/client`
* Run commands with: `pnpm run lint --filter @myapp/client`
* To run command recursively in all packages: `pnpm -r run lint`. NOTE: this will halt on first error so you might want to run it as script instead with `concurrently`.
* [You can use various filter options](https://pnpm.io/filtering): `pnpm --filter=!api run lint`
* [Update dependencies to latest given their version range](https://pnpm.io/cli/update): `pnpm update`

