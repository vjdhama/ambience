require "yaml"

module Ambience
  class Application

    getter environment

    DEFAULT_ENVIRONMENT = "development"

    def initialize(@path, @environment=DEFAULT_ENVIRONMENT)
      @configuration = {} of String => Hash(String, String)
    end

    def load
      raise Ambience::InvalidPathException.new unless File.exists?(@path)
      @configuration = YAML.load(File.read(@path))
    end
  end
end
