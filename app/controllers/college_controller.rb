require './config/environment'
class CollegeController < ApplicationController

  get '/' do
    erb :welcome
  end

  get '/colleges'/new' do
    if logged_in?
      erb :'colleges/create_college'
    else
      redirect to '/login'
    end
  end

  post '/colleges' do
    if logged_in?
    redirect to 'applicants/login'
  end

  get '/colleges/:id' do

  end

  get '/colleges/:id/edit' do

  end

  # patch do
  #
  # end

  put '/colleges/:id' do

  end

  delete '/colleges/:id' do

  end

end
