require 'sinatra'

set :port, 4567
set :bind, '0.0.0.0' # Required to bind to all interfaces

get '/' do
  'Hello world'
end
