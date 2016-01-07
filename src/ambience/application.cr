module Ambience
  class Application
    
    getter environment

    DEFAULT_ENVIRONMENT = "development"

    def initialize(@path, @environment=DEFAULT_ENVIRONMENT)
    end

    def load
      raise Ambience::InvalidPathException.new unless File.exists?(@path)
    end
  end
end
