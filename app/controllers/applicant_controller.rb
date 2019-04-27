require './config/environment'
class ApplicantController < ApplicationController


  get '/registration' do
    erb :'applicant/registration'
  end


  post '/registration' do # Creates 1 applicant
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to 'applicant/registration'
    else
      @applicant = Applicant.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @applicant.save
      session[:applicant_id] = @applicant.id
      redirect to '/colleges'
      end
  end



  get '/login' do
    if logged_in?
      erb :'applicant/login'

    else
      redirect '/colleges'

    end
  end

  post '/login' do
    applicant = Applicant.find_by(:username => params[:username])
    if applicant && user.authenticate(params[:password])
      session[:applicant_id] = applicant.id
      redirect '/colleges'
    else
      redirect to 'applicant/registration'
    end
  end



  get '/registration/new' do # Display Registration Form to Create Applicant
    erb :'applicant/registraton'
  end
  #
  # # post '/applicant' do
  # #
  # # end
  #
  #
  #
  # patch do
  #
  # end
  #
  # # put '/applicant/:id' do
  # #
  # # end
  #


end
