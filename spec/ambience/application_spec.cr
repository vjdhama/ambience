require "../spec_helper"

describe Ambience::Application do

  it "should initialize with default path and environment" do
    application = Ambience::Application.new()
    application.path.should eq("config/application.yml")
    application.env.should eq("development")
  end
end
