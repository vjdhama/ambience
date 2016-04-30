require "kemal"
require "../../../../src/ambience"

Ambience.application(File.expand_path("#{__DIR__}/../config/configuration.yml"), "development")
Ambience.load

require "./your_app/*"

Kemal.run

