# ambience [![Build Status](https://travis-ci.org/vjdhama/ambience.svg?branch=master)](https://travis-ci.org/vjdhama/ambience)

App configuration using `ENV` for [Crystal](http://crystal-lang.org/) applications inspired by [figaro](https://github.com/laserlemon/figaro).

## Status

Currently ambience is under active development.

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  ambience:
    github: vjdhama/ambience
    version: ~> 0.3.6
```

## Usage

```crystal
require "ambience"

Ambience.application("configuration_file_path", "environment")
Ambience.load
```

Refer example kemal
[application](https://github.com/vjdhama/ambience/tree/master/examples/kemal/your_app) for more insight.

## Example configuration file

```yaml
api_url: example.com
development:
  app_id: foobar123
  app_key: barfoo123

production:
  app_id: bar123foo
  app_key: 123foobar
```

##TODO'S

- [x] Convenience Proxy Methods.
- [ ] Required keys convenience method.
- [ ] Cli for Ambience.
- [ ] Add examples for [frost](https://github.com/ysbaddaden/frost/).
- [X] Add examples for [kemal](https://github.com/sdogruyol/kemal).

## Contributing

1. Fork it ( https://github.com/vjdhama/ambience/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [vjdhama](https://github.com/vjdhama) - Vijay Dhama : creator, maintainer
