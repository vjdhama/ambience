module Ambience
  class Application

    getter path
    getter env

    DEFAULT_PATH = "config/application.yml"
    DEFAULT_ENVIRONMENT = "development"

    def initialize(@env=DEFAULT_ENVIRONMENT, @path=DEFAULT_PATH)
    end
  end
end
