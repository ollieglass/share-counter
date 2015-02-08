Gem::Specification.new do |s|
  s.name        = 'share-counter'
  s.license     = 'MIT'

  s.version     = '0.0.9'
  s.date        = '2015-12-15'

  s.summary     = "ShareCounter"
  s.description = "Check how many times a URL has been shared on social networks and aggregators"

  s.authors     = ["Ollie Glass"]
  s.email       = 'ollieglaskovik@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/share-counter'

  s.files       = ["lib/share-counter.rb"]

  s.add_runtime_dependency 'nokogiri', '~> 1.6'
  s.add_runtime_dependency 'rest-client', ['~> 1.6']
  s.add_development_dependency "rspec"
  s.add_development_dependency 'rake'
end

