require "./ambience/*"

module Ambience
  def self.application(path, environment)
    @@application = Application.new(path, environment)
  end

  def self.load
    @@application.try &.load
  end

  def self.env
    @@application.try &.env
  end
end
