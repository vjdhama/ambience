require "./ambience/*"

module Ambience
  def application(@path, @environment)
    @application ||= Application.new(@path, @environment)
  end

  def load
    application.load
  end

  def env
    application.env
  end
end
