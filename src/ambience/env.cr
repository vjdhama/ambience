module Ambience
  class Env
    def initialize(@config)
    end

    def load
      config = @config
      config.each { |key, value| ENV[key.to_s] = value.to_s } if config.is_a?(Hash)
    end
  end
end
