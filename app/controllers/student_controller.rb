require './config/environment'

class StudentController < ApplicationController

  get '/registration' do
    if !logged_in?
      erb :registration
    else
      redirect '/college/create'
    end
  end


  post '/registration' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/registration'
    else
# binding.pry
      @student = Student.new(:username => params[:username], :email => params[:email], :password => params[:password])
      # @student = Student.new(username: params['username'], email: params['email'], password: params['password'])
      @student.save
      session[:student_id] = @student.id
      redirect  '/login'
      end
  end


  get '/login' do
  if logged_in?
    erb :college/create
  else
    redirect '/student/registration'
  end
  end


  post '/login' do
    @student = Student.find_by(:username => params[:username])
    if student && student.authenticate(params[:password])
      session[:student_id] = student.id
      redirect '/college/create'
    else
      redirect '/student/registration'
    end
  end


  get '/student/logout' do
      session.clear
      redirect '/student/logout'
    end




end
