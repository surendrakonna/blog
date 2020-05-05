# Automate Publishing API documentation using CI/CD

## Getting Started

### Prerequisites

*   [Git](http://git-scm.com/)
*   [Ruby 2.7.1](https://www.ruby-lang.org/en/)
*   [Ruby 2.7.1 using RVM](https://rvm.io/rvm/install)
*   [Bundler](http://bundler.io/)
*   [Homebrew](https://brew.sh/)
*   [Node using NVM](https://formulae.brew.sh/formula/nvm)

## How to Start the Application

1.  Clone the application from github

```bash
git clone git@github.com:surendrakonna/blog.git
```

2.  Install gems

```bash
bundle install
```

3. create .env file and set ENV. Refer to .env.sample file

4.  Start the server and start playing with the application

```bash
rails s
```

## For Testing the Application


Run the specs
```bash
bundle exec rspec
```

## Documentation
Follow below steps to generate documentation in local

Generate blueprint markdown blocks from the request specs
```bash
rake docs:generate
```

Convert blueprint markdown blocks into API description documents
```bash
npm install -g aglio
aglio -i doc/api/index.apib --theme-template triple -o doc/api/index.html
```
Opens the API document in browser
```bash
open doc/api/index.html
```

## Questions

If you have any questions about this repository, please email [Surendra](mailto:surendra.konna@gmail.com).
