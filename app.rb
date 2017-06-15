require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  deploy_time = File.exist?("./deploy_time") ? File.read('./deploy_time') : DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
  "Hello!!<br />Deploy time is #{deploy_time}"
end
