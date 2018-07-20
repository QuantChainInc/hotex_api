$:.push File.expand_path("../lib", __FILE__)

require "hotex_api/client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hotex_api"
  s.version     = HotexAPI::Client::VERSION
  s.authors     = ["Hotex Opensource"]
  s.email       = ["gnuser@163.com"]
  s.homepage    = "https://github.com/hotex/hotex_rest_api"
  s.summary     = "A ruby client to access Hotex's API."
  s.description = "A ruby client which can access all Hotex's API."
  s.license     = 'MIT'

  s.require_paths = ["lib"]
  s.files       = Dir["{bin,lib}/**/*"] + ["README.markdown"]

  s.add_runtime_dependency 'faye-websocket', '~> 0.9.2'
  s.add_development_dependency 'minitest', '~> 5.5.1'
end
