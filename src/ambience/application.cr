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
      @env_hash = environment_configuration
    end

    private def environment_configuration
      configuration = raw_configuration
      configuration = configuration[@environment] if configuration.is_a?(Hash)
    end

    private def raw_configuration
      YAML.load(File.read(@path))
    end
  end
end
