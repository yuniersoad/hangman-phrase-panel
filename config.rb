
require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

enable :sessions
set :session_secret, 'thisIsAKleerSecret'


ENV['PHRASES_HOST'] = ENV.fetch('PHRASES_SERVICE_PORT_8081_TCP_ADDR', 'localhost')
ENV['PHRASES_PORT'] = ENV.fetch('PHRASES_SERVICE_PORT_8081_TCP_PORT', '8081')

