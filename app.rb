require 'sinatra'

get '/' do
  erb :main, locals: {text: 'woof! woof!'}
end

post '/' do
  sayit = params[:sayit]
  erb :main, locals: {text: "rooof! #{sayit}"}
end
