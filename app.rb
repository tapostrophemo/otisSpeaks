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

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

get '/' do
  erb :main, locals: {dog: 'woof! woof!', speaking: false}
end

post '/' do
  human = params[:sayit]
  dog = to_dogspeak(human)
  erb :main, locals: {dog: "rooof! #{dog}", speaking: true, human: human}
end
