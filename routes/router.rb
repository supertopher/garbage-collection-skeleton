get '/' do
  erb :index
end

get '/quiz' do
  unless request.xhr?
    erb :quiz
  else
    erb :quiz, layout: false
  end
end