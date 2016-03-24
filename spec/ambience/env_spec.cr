require "../spec_helper"

Spec2.describe Ambience::Env do
  Spec2.describe "#load" do
    it "should set key value pair" do
      config = {"foo" => "bar"}
      env = Ambience::Env.new(config)
      env.load
      expect { ENV["foo"] }.not_to eq(nil)
    end
  end
end
