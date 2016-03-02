require "./ambience/*"

module Ambience
  def self.application(path, environment)
    Application.new(path, environment)
  end

  def self.load
    self.application.load
  end

  def self.env
    self.application.env
  end
end
