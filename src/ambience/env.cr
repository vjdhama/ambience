module Ambience
  class Env
    def initialize(@config : Hash)
    end

    def load
      @config.each do |key, value|
        ENV[key.to_s] = value if key.is_a?(String)
      end
    end
  end
end
