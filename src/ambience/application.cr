require "yaml"

module Ambience
  class Application

    getter environment

    DEFAULT_ENVIRONMENT = "development"

    def initialize(@path, @environment=DEFAULT_ENVIRONMENT)
      @env_hash = {} of String => String
    end

    def load
      raise Ambience::InvalidPathException.new unless File.exists?(@path)
      @env_hash = environment_configuration
      Env.new(@env_hash).load
    end

    private def environment_configuration
      configuration = raw_configuration
      if configuration.is_a?(Hash)
        global_configuration = configuration.select{|key, value| value.is_a?(String)}
        configuration = configuration[@environment]
      end
      if global_configuration.is_a?(Hash) && configuration.is_a?(Hash)
        configuration.merge(global_configuration)
      end
    end

    private def raw_configuration
      YAML.load(File.read(@path))
    end
  end
end
