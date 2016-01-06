require "./spec_helper"

Spec2.describe Ambience do
  it "should not have empty version number" do
    expect(Ambience::VERSION).not_to eq("")
  end
end
