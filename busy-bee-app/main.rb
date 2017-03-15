require "pry"
require "sinatra"
require "sinatra/reloader"
require "pg"
require_relative "database_config"
require_relative "models/developers"
require_relative "models/feedbacks"
require_relative "models/jobs"
require_relative "models/requesters"
require_relative "models/users"

enable :sessions

helpers do

  def current_user
    User.find_by(user_id: session[:user_id])
  end

  def current_requester
    Requester.find_by(user_id: session[:use r_id])
  end

  def logged_in?
    !!current_user
  end

end

after do
  ActiveRecord::Base.connection.close
end

# login, logout
get '/' do
  erb :login
end

post '/' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/user'
  else
    erb :login
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect '/'
end

# New Users
get '/user/new' do
  erb :new_user
end

post '/user/new' do
  new_user = User.new
  new_user.first_name = params[:first_name]
  new_user.last_name = params[:last_name]
  new_user.address = params[:address]
  new_user.suburb = params[:suburb]
  new_user.postcode = params[:postcode]
  new_user.country = params[:country]
  new_user.email = params[:email]
  new_user.contact_person = params[:contact_person]
  new_user.paypal_account = params[:paypal_account]
  new_user.abn = params[:abn]
  new_user.tfn = params[:tfn]
  new_user.password = params[:password]
  if new_user.save
    redirect "/"
  else
    erb :new_user
  end
end

#User
get '/user' do
  @user = current_user
  erb :index
end

# New job request
get '/request' do
  current_requester = Requester.find_by(user_id: current_user.user_id)
  if current_requester == nil
    new_requester = Requester.new
    new_requester.user_id = current_user.user_id
    new_requester.save
  else
    @requester = current_requester
  end
  erb :new_job
end

post '/request' do
  new_job = Job.new
  new_job.requester_id = current_requester.requester_id
  new_job.job_title = params[:job_title]
  new_job.reward = params[:reward]
  new_job.description = params[:description]
  new_job.platform = params[:platform]
  new_job.post_date = params[:post_date]
  new_job.due_date = params[:due_date]
  if new_job.save
    redirect "/request"
  else
    erb :new_job
  end
end

#jobs
get '/develop' do
  current_developer = Developer.find_by(user_id: current_user.user_id)
  if current_developer == nil
    new_developer = Developer.new
    new_developer.user_id = current_user.user_id
    new_developer.save
  else
    @developer = current_developer
  end
  erb :jobs_list
end

#New Feedback
