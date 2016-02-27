require "kemal"
require "ambience"

app = Ambience::Application.new(File.expand_path("#{__DIR__}/../config/configuration.yml"), "development")
app.load

require "./your_app/*"
