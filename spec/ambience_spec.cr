require "./spec_helper"

describe Ambience do
  it "should not have empty version number" do
    Ambience::VERSION.should_not eq("")
  end
end
