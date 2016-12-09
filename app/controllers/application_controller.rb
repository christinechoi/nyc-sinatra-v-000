class ApplicationController < Sinatra::Base
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets


  # get '/figures/new' do
  #   "Hello World"
  # end

end
