# require "pry"
require "sinatra"
# require "sinatra/reloader"
require "pg"
require "pony"
require_relative "database_config"
require_relative "models/developers"
require_relative "models/feedbacks"
require_relative "models/jobs"
require_relative "models/requesters"
require_relative "models/users"

set :raise_errors, false
set :show_exceptions, false
enable :sessions

helpers do

  def current_user
    User.find_by(user_id: session[:user_id])
  end

  def current_requester
    Requester.find_by(user_id: session[:user_id])
  end

  def current_developer
    Developer.find_by(user_id: session[:user_id])
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

#User
get '/user' do
  @user = current_user
  erb :index
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

# Requester
get '/request' do
    @requests = Job.where(requester_id: current_requester.requester_id)
  erb :request
end

#requester
#requester details
get '/:id/requester' do
    @job = Job.find(params[:id])
    @requester = @job.requester
    @user_requester = @requester.user
    @feedbacks = @job.feedbacks
    erb :requester_details
end

#New request
get '/request/new' do
  if current_requester == nil
    new_requester = Requester.new
    new_requester.user_id = current_user.user_id
    new_requester.save
  end
  erb :new_request
end

post '/request/new' do
  new_job = Job.new
  new_job.requester_id = current_requester.requester_id
  new_job.job_title = params[:job_title]
  new_job.reward = params[:reward]
  new_job.description = params[:description]
  new_job.platform = params[:platform]
  new_job.post_date = Time.now
  new_job.due_date = params[:due_date]
  if new_job.save
    redirect "/request"
  else
    erb :new_request
  end
end

# edit request
get '/request/:id/edit' do
  @job = Job.find(params[:id])
  erb :edit_request
end

put '/request/:id' do
  request = Job.find(params[:id])
  request.job_title = params[:job_title]
  request.reward = params[:reward]
  request.description = params[:description]
  request.platform = params[:platform]
  request.due_date = params[:due_date]
  if request.save
    redirect "/request"
  else
    erb :edit_request
  end
end

# delete request
delete '/request/:id/delete' do
  request = Job.find(params[:id])
  request.delete
  redirect '/request'
end

#give feedback
get '/:id/feedback/new' do
  @job = Job.find(params[:id])
  erb :new_feedback
end

post '/:id/feedback/new' do
  job = Job.find(params[:id])
  new_feedback = Feedback.new
  new_feedback.user_id = current_user.user_id
  new_feedback.job_id = job.job_id
  new_feedback.comment = params[:comment]
  new_feedback.comment_type = params[:type]
  if new_feedback.save
    if job.status == nil
      job.status = 'completed'
      job.save
    end
    redirect '/request'
  else
    erb :new_feedback
  end
end

#developers
#developer details
get '/:id/developer' do
    @job = Job.find(params[:id])
    @developer = @job.developer
    @user_developer = @developer.user
    @feedbacks = @job.feedbacks
    erb :developer_details
end

#developer page
get '/develop' do
  if current_developer == nil
    new_developer = Developer.new
    new_developer.user_id = current_user.user_id
    new_developer.save
    @projects = nil
  else
    @developer = current_developer
    @projects =  @developer.jobs
  end
  erb :developer
end

# submit project
get '/develop/:id/submit' do
  @project = Job.find(params[:id])
  erb :submit_project
end

post '/develop/:id/submit' do
  project = Job.find(params[:id])
  developer = project.developer.user.email
  requester = project.requester.user.email
  Pony.mail :to => requester,
            :from => developer,
            :subject => project.job_title,
            :body => params[:message]
    redirect '/develop'
end

# cancel projects
delete '/develop/:id/delete' do
  project = Job.find(params[:id])
  project.developer_id = nil
  project.save
  redirect '/develop'
end

# jobs
get '/jobs_list' do
  @jobs = Job.where(developer_id: nil)
  erb :jobs_list
end

get '/jobs_list/:id' do
  job = Job.find(params[:id])
  if current_developer == nil
    new_developer = Developer.new
    new_developer.user_id = current_user.user_id
    new_developer.save
    job.developer_id = current_developer.developer_id
    job.save
  else
    job.developer_id = current_developer.developer_id
    job.save
  end
  redirect '/develop'
end
