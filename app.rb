require 'sinatra'

module WordUtils
  DOG_WURDZ = {
    'a' => 'aaarrr',
    'e' => 'rrrrreeee',
    'i' => 'yeeeelp',
    'o' => 'aarrroooooo',
    'u' => 'wooof',
  }

  def to_dogspeak(str)
    vowels = str.gsub(/[^aeiou ]/, '').split(' ')
    vowels.map {|v| DOG_WURDZ[v[0]]}.join(' ')
  end
end

helpers WordUtils

get '/' do
  erb :main, locals: {text: 'woof! woof!'}
end

post '/' do
  sayit = to_dogspeak(params[:sayit])
  erb :main, locals: {text: "rooof! #{sayit}"}
end
