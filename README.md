# App Prototype

...

Generated with [Raygun](https://github.com/carbonfive/raygun).

# Development

## Getting Started

### Requirements

To run the specs or fire up the server, be sure you have these installed (and running):

* Ruby 2.6 (see [.ruby-version](.ruby-version)).
* PostgreSQL 11.2+ (`brew install postgresql`).
* Heroku CLI (`brew install heroku`).

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

The easiest way to run the app is using `heroku local`. This starts all the processes defined in `Procfile`, including the Rails server.

    $ heroku local
    $ open http://localhost:3000

## Conventions

### Git

* Branch `development` is auto-deployed to acceptance.
* Branch `master` is auto-deployed to production.
* Create feature branches off of `development` using the naming convention
  `(features|chores|bugs)/a-brief-description-######`, where ###### is the tracker id.
* Rebase your feature branch before merging into `development` to produce clean/compact merge bubbles.
* Always retain merge commits when merging into `development` (e.g. `git merge --no-ff branchname`).
* Use `git merge development` (fast-forward, no merge commit) from `master`.
* Craft atomic commits that make sense on their own and can be easily cherry-picked or reverted if necessary.

### Code Style

Rubocop is configured to enforce the style guide for this project.

## Additional/Optional Development Details

### Code Coverage (local)

Coverage for the ruby specs:

    $ COVERAGE=true rspec

Code coverage is reported to Code Climate on every CI build so there's a record of trending.

### Using Guard

Guard is configured to run ruby specs, and also listen for livereload connections.

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

**Required**

* `SECRET_KEY_BASE` - Secret key base for verifying signed cookies. Should be 30+ random characters and secret!

**Optional**

* `HOSTNAME` - Canonical hostname for this application. Other incoming requests will be redirected to this hostname.
* `FORCE_SSL` - Require all requests to come over a secure connection (default: false).
* `BASIC_AUTH_PASSWORD` - Enable basic auth with this password.
* `BASIC_AUTH_USER` - Set a basic auth username (not required, password enables basic auth).
* `RACK_TIMEOUT_SERVICE_TIMEOUT` - Terminate requests that take longer than this time (default: 15s).
* `ASSET_HOST` - Asset host for static assets (e.g. CDN) (default: none).
* `PORT` - Port to listen on (default: 3000).
* `WEB_CONCURRENCY` - Number of puma workers to spawn (default: 1).
* `RAILS_MAX_THREADS` - Threads per worker (default: 5).
* `RAILS_MIN_THREADS` - Threads per worker (default: 5).
* `DB_POOL` - Number of DB connections per pool (i.e. per worker) (default: RAILS_MAX_THREADS or 5).
* `RAILS_LOG_TO_STDOUT` - Log to standard out, good for Heroku (default: false).
* `RAILS_SERVE_STATIC_FILES` - Serve static assets, good for Heroku (default: false).

### Third Party Services

* Heroku for hosting.
* CircleCI for continuous integration.
