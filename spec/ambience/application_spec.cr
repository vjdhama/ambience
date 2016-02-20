require "../spec_helper"
require "tempfile"
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
    def yaml_to_path(yaml)
      tempfile = Tempfile.open(yaml) do |file|
        file.print(yaml)
      end
      tempfile.path
    end

    it "raises error if path is not valid" do
      path = "wrong/path.yml"
      allow(File).to receive(self.exists?(path)).and_return(false)
      application = Ambience::Application.new(path, "development")
      expect { application.load }.to raise_error Ambience::InvalidPathException
    end

    it "does not raise error if path is valid" do
      path = "right/path.yml"
      allow(File).to receive(self.exists?(path)).and_return(true)
      application = Ambience::Application.new(path, "development")
      expect { application.load }.not_to raise_error Ambience::InvalidPathException
    end

    it "does not raise error if file content is empty" do
      yaml = <<-YML

      YML
      tempfile_path = yaml_to_path(yaml)
      allow(File).to receive(self.exists?(tempfile_path)).and_return(true)
      application = Ambience::Application.new(tempfile_path, "development")
      expect { application.load }.not_to raise_error
    end

    it "loads configuration from file" do
      yaml = <<-YML
      development:
        foo: bar
      YML

      tempfile_path = yaml_to_path(yaml)
      allow(File).to receive(self.exists?(tempfile_path)).and_return(true)
      application = Ambience::Application.new(tempfile_path, "development")
      expect(application.load).to eq({"foo" => "bar"})
    end

    it "does not load configuration from improper formated file" do
      yaml = <<-YML
      development
        foo: bar
      YML
      tempfile_path = yaml_to_path(yaml)
      allow(File).to receive(self.exists?(tempfile_path)).and_return(true)
      application = Ambience::Application.new(tempfile_path, "development")
      expect { application.load }.to raise_error YAML::ParseException
    end

    it "merges global configuration with environment specific configuration" do
      yaml = <<-YML
      test: value
      development:
        foo: bar
      YML
      tempfile_path = yaml_to_path(yaml)
      allow(File).to receive(self.exists?(tempfile_path)).and_return(true)
      application = Ambience::Application.new(tempfile_path, "development")
      expect(application.load).to eq({"foo" => "bar", "test" => "value"})
    end
  end
end
