get '/' do
  erb :index
end

get '/cats' do
  unless request.xhr?
    erb :cats
  else
    erb :cats, layout: false
  end
end