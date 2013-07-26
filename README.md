![Klarna Logo](https://raw.github.com/futhr/spree-klarna/2-0-stable/klarna.png)
[![Build Status](https://secure.travis-ci.org/futhr/spree-klarna.png?branch=2-0-stable)](http://travis-ci.org/futhr/spree-klarna)
[![Dependency Status](https://gemnasium.com/futhr/spree-klarna.png)](https://gemnasium.com/futhr/spree-klarna)
[![Coverage Status](https://coveralls.io/repos/futhr/spree-klarna/badge.png?branch=2-0-stable)](https://coveralls.io/r/futhr/spree-klarna)

*Klarna Checkout based on [Klarna API 2.0][7]*

Contact [Klarna][1] to learn more about their integrated services and what it takes to get them up and running.

## Installation

Add to your `Gemfile`
```ruby
gem 'spree_klarna', github: 'futhr/spree-klarna', branch: '2-0-stable'
```

Run

    bundle install
    rails g spree_klarna:install

## Contributing

In the spirit of [free software][2], **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting [bugs][3]
* by suggesting new features
* by writing [translations][5]
* by writing or editing documentation
* by writing specifications
* by writing code (*no patch is too small*: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues][3]
* by reviewing patches

Starting point:

* Fork the repo
* Clone your repo
* Run `bundle install`
* Run `bundle exec rake test_app` to create the test application in `spec/test_app`
* Make your changes and follow this [Style Guide][6]
* Ensure specs pass by running `bundle exec rspec spec`
* Submit your pull request

Copyright (c) 2013 Tobias Bohwalli, released under the [New BSD License][4]

[1]: http://klarna.se
[2]: http://www.fsf.org/licensing/essays/free-sw.html
[3]: https://github.com/futhr/spree-klarna/issues
[4]: https://github.com/futhr/spree-klarna/blob/2-0-stable/LICENSE.md
[5]: http://www.localeapp.com/projects/
[6]: https://github.com/thoughtbot/guides
[7]: https://docs.klarna.com/en/getting-started#introduction
