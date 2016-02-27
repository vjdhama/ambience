# Sample kemal app with ambience

This app demostrates how to use ambience with kemal.

## Usage

1. cd into your_app
2. Modify  `src/your_app/your_app.cr` to give absolute path of config
   file as first argument to `Ambience::Application.new`
3. Run `shards install`
4. Run `crystal build --release src/your_app.cr`
5. Run `./your_app`

