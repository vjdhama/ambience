require "../spec_helper"

create_mock File do
  mock self.exists?(path)
end

Spec2.describe Ambience::Application do

  Spec2.describe "#initialize" do
    it "should initialize with default environment if not provided" do
      path = "right/path.yml"
      application = Ambience::Application.new(path)
      expect(application.environment).to eq("development")
    end
  end

  Spec2.describe "#load" do
    it "should raise error if path is not valid" do
      path = "wrong/path.yml"
      allow(File).to receive(self.exists?(path)).and_return(false)
      application = Ambience::Application.new(path, "development")
      expect{application.load}.to raise_error Ambience::InvalidPathException
    end

    it "should not raise error if path is valid" do
      path = "right/path.yml"
      allow(File).to receive(self.exists?(path)).and_return(true)
      application = Ambience::Application.new(path, "development")
      expect{application.load}.not_to raise_error Ambience::InvalidPathException
    end
  end
end
