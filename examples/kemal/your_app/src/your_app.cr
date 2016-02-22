require "kemal"
require "ambience"

app = Ambience::Application.new("/home/vagrant/ambience/examples/kemal/your_app/config/configuration.yml", "development")
app.load

require "./your_app/*"
