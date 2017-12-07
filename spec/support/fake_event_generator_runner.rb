FakeEventGeneratorRunner =
  Capybara::Discoball::Runner.new(FakeEventGenerator::Application) do |server|
    FakeEventGenerator::Application.base_url = "http://#{server.host}:#{server.port}"
  end


