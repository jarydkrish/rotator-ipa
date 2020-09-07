<div style="text-align: center">
  <img src="https://rotatoripa.co/rotator-ipa-sharing-icon.png?v=1" alt="Rotator IPA"></img>
</div>

## Getting Started

### Prerequisites
Please install the following:
- [Ruby](https://www.ruby-lang.org/en/downloads/)
  - Feel free to use [RVM](https://rvm.io/) or [Rbenv (recommended)](https://github.com/rbenv/rbenv) for version management
- [NodeJS](https://nodejs.org/en/)
  - Feel free to use [NVM](https://github.com/creationix/nvm) or [Nodenv (recommended)](https://github.com/nodenv/nodenv) for version management
- [Postgres.app](https://postgresapp.com/)
- [Optional] [Redis.app](https://jpadilla.github.io/redisapp/)
- [Optional] [Medis](http://getmedis.com/)

In order to run the project in development, you'll need to install the
required RubyGems, NPM modules, and set up your Postgres database:

```bash
bundle install
yarn install
rails db:setup
```

Problems getting everything setup? Check for the following gem problems
- [pg](https://stackoverflow.com/a/20226895)
- [puma](https://stackoverflow.com/a/53404317/10750268)
- [eventmachine](https://github.com/eventmachine/eventmachine/issues/661#issuecomment-182531919)

### Linting

We use linters for [static code analysis](https://en.wikipedia.org/wiki/Static_program_analysis). I would highly encourage you to consider using them for all coding projects, not just this one.

You can use the following command to install our linters for [Atom, our preferred code editor](https://atom.io/):
```bash
apm install linter linter-rubocop
```

#### Rubocop
We use [RuboCop](http://rubocop.readthedocs.io/en/latest/) as our ruby linter.

Run the following to install RubyCop globally:
```shell
gem install rubocop
```

### Running in Development

A rails command is included to start up Postgres.app
if it isn't running already and then start the Rails
app with Puma at <http://localhost:3000>.

```bash
rails s
```

## Initial Deployment

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/jarydkrish/rotator-ipa)
