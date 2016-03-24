require "yaml"

module Ambience
  class Application
    getter environment
    getter env

    DEFAULT_ENVIRONMENT = "development"

    def initialize(@path, @environment = DEFAULT_ENVIRONMENT)
      @env = {} of String => String
    end

    def load
      raise Ambience::InvalidPathException.new unless File.exists?(@path)
      @env = environment_configuration
      Env.new(@env).load
    end

    private def environment_configuration
      configuration = raw_configuration
      if configuration.empty?
        configuration
      else
        global_configuration = configuration.select { |key, value| value.is_a?(String) }
        configuration = configuration[@environment]
        case configuration
        when (Nil | String | Array(YAML::Type))
          global_configuration
        when Hash
          configuration.merge(global_configuration)
        end
      end
    end

    private def raw_configuration
      file_content = File.read(@path)
      if file_content.empty?
        {} of String => String
      else
        YAML.parse(file_content).as_h
      end
    end
  end
end
