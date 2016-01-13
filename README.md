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
```


## Usage


```crystal
require "ambience"

app = Ambience::Application.new("absolute_path_of_config_file", "environment")
app.load
```



## Contributing

1. Fork it ( https://github.com/vjdhama/ambience/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [vjdhama](https://github.com/vjdhama) - Vijay Dhama : creator, maintainer
