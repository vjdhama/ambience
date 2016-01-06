module Ambience
  class Application

    getter path
    getter environment

    DEFAULT_PATH = "config/application.yml"
    DEFAULT_ENVIRONMENT = "development"

    def initialize(@environment=DEFAULT_ENVIRONMENT, @path=DEFAULT_PATH)
    end

    def load
      raise Ambience::InvalidPathException.new unless File.exists?(@path)
    end
  end
end
