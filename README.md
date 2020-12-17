# App Prototype

...

Generated with [Raygun](https://github.com/carbonfive/raygun).

# Development

## Getting Started

### Requirements

To run the specs or fire up the server, be sure you have these installed (and running):

* Ruby 2.7 (see [.ruby-version](.ruby-version)).
* Node 12 (see [.node-version](.node-version)).
* Yarn 1.x (`npm install -g yarn`).
* PostgreSQL 13.1+. (`brew install postgresql`).

To manage deployments you will need:

* Heroku CLI (`brew install heroku`).

It is strongly recommended that you use a version manager like [rbenv](https://github.com/rbenv/rbenv) (for Ruby), [nvm](https://github.com/nvm-sh/nvm) or [nodenv](https://github.com/nodenv/nodenv) (for Node), or [asdf](https://asdf-vm.com/) (for both) to ensure the correct Ruby and Node versions.

### First Time Setup

#### `bin/setup`

After cloning, run [./bin/setup](bin/setup) to install missing gems and prepare the database.

Note, `rake db:sample_data` (run as part of setup) loads a small set of data for development. Check out
[db/sample_data.rb](db/sample_data.rb) for details.

#### `.env`

The `bin/setup` script will create a `.env` file that defines settings for your local environment. Do not check this into source control. Refer to the [environment variables](#environment-variables) section below for what can be specified in `.env`.

### Running the Specs

To run all Ruby and Javascript specs.

    $ ./bin/rake

Note: `./bin/rake` runs the springified version of rake (there's a `./bin/rspec` and `./bin/rails` too). You can add
`./bin` to your PATH too, then you'll always use the springified bins when they exist. See
[rails/spring](https://github.com/rails/spring) for additional information.

### Running the Application Locally

The easiest way to run the app is using `yarn start`. This starts all the processes defined in `Procfile.dev`, including the Rails server and the webpack dev server.

    $ yarn start

The app will then be accessible at <http://localhost:3000>.

### Webpack Dev Server

By default, webpacker will compile assets on demand. In other words, you don’t need to precompile all assets ahead of time — webpacker lazily compiles assets it has not served yet. However, you will need to manually reload your browser to see new changes when you edit an asset.

Alternatively, for live code reloading, you can run `./bin/webpack-dev-server` in a separate terminal from `rails s`. This done for you automatically if you use `yarn start` to run the app. Asset requests are proxied to the dev server, and it will automatically refresh your browser when it detects changes to the pack.

If you stop the dev server, Rails automatically reverts back to on-demand compilation.

## Conventions

### Git

* Branch `development` is auto-deployed to acceptance.
* Branch `main` is auto-deployed to production.
* Create feature branches off of `development` using the naming convention
  `(features|chores|bugs)/a-brief-description-######`, where ###### is the tracker id.
* Rebase your feature branch before merging into `development` to produce clean/compact merge bubbles.
* Always retain merge commits when merging into `development` (e.g. `git merge --no-ff branchname`).
* Use `git merge development` (fast-forward, no merge commit) from `main`.
* Craft atomic commits that make sense on their own and can be easily cherry-picked or reverted if necessary.

### Code Style

Rubocop is configured to enforce the style guide for this project.

## Additional/Optional Development Details

### Code Coverage (local)

Coverage for the ruby specs:

    $ COVERAGE=true rspec

Code coverage is reported to Code Climate on every CI build so there's a record of trending.

### Using Guard

Run `guard` to automatically listen for file changes and run the appropriate specs:

    $ bundle exec guard

### Using Mailcatcher

    $ gem install mailcatcher
    $ mailcatcher
    $ open http://localhost:1080/

Learn more at [mailcatcher.me](http://mailcatcher.me/). And please don't add mailcatcher to the Gemfile.

### Using ChromeDriver

The ChromeDriver version used in this project is maintained by the [webdrivers](https://github.com/titusfortner/webdrivers) gem.  This is means that the
feature specs are not running against the ChromeDriver installed previously on the machine, such as by Homebrew.

### Headed vs headless Chrome

System specs marked with `js: true` run using headless Chrome by default, in the interest of speed. When writing or troubleshooting specs, you may want to run the normal (i.e. "headed") version of Chrome so you can see what is being rendered and use the Chrome developer tools.

To do so, specify `HEADLESS=false` in your environment when running the specs. For example:

    $ HEADLESS=false bin/rspec spec/system

### Continuous Integration/Deployment with CircleCI and Heroku

This project is configured for continuous integration with CircleCI, see [.circleci/config.yml](.circleci/config.yml) for details.

On successful builds, Heroku will trigger a deployment via its
[GitHub Integration](https://devcenter.heroku.com/articles/github-integration#automatic-deploys).

# Server Environments

### Hosting

Acceptance and Production are hosted on Heroku under the _email@example.com_ account.

### Environment Variables

Several common features and operational parameters can be set using environment variables.

**Required for deployment**

* `DATABASE_URL` - URL of the PostgreSQL database; e.g. `postgres://user:password@host:port/database`
* `NODE_ENV` - Set to `production` for all deployment environments
* `RACK_ENV` - Set to `production` for all deployment environments
* `RAILS_ENV` - Set to `production` for all deployment environments
* `SECRET_KEY_BASE` - Secret key base for verifying signed cookies. Should be 30+ random characters and secret!

**Optional**

* `ASSET_HOST` - Load assets from this host (e.g. CDN) (default: none).
* `BASIC_AUTH_PASSWORD` - Enable basic auth with this password.
* `BASIC_AUTH_USER` - Set a basic auth username (not required, password enables basic auth).
* `CANONICAL_HOSTNAME` - Canonical hostname for this application. Other incoming requests will be redirected to this hostname. Also used by mailers to generate full URLs.
* `DB_POOL` - Number of DB connections per pool (i.e. per worker) (default: RAILS_MAX_THREADS or 5).
* `FORCE_SSL` - Require SSL for all requests, redirecting if necessary (default: false).
* `PORT` - Port to listen on (default: 3000).
* `RACK_TIMEOUT_SERVICE_TIMEOUT` - Terminate requests that take longer than this time (default: 15s).
* `RAILS_LOG_TO_STDOUT` - Log to standard out, good for Heroku (default: false).
* `RAILS_MAX_THREADS` - Threads per worker (default: 5).
* `RAILS_MIN_THREADS` - Threads per worker (default: 5).
* `RAILS_SERVE_STATIC_FILES` - Serve static assets, good for Heroku (default: false).
* `WEB_CONCURRENCY` - Number of puma workers to spawn (default: 1).

### Third Party Services

* Heroku for hosting.
* CircleCI for continuous integration.
