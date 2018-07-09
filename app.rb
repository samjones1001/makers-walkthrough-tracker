ENV['RACK_ENV']||='dev'

require 'sinatra/base'

require_relative 'data_mapper_setup'
require_relative './lib/cohort'
require_relative './lib/student'
require_relative './lib/challenge'
require_relative './lib/stage'
require_relative './lib/result'

class WalkthroughTracker < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/cohorts'
  end

  get '/cohorts' do
    @cohorts = Cohort.all
    erb :'cohorts/index'
  end

  get '/cohorts/:id/students' do
    @students = Student.all(:cohort_id => params['id'])
    erb :'cohorts/students'
  end

  post '/students' do
    session[:student_id] = params[:student_id]
    redirect '/challenges'
  end

  get '/challenges' do
    redirect '/cohorts' if !session[:student_id]
    @challenges = Challenge.all
    erb :'challenges/index'
  end

  get '/challenges/:id/stages' do
    @stage = Stage.get_next(session[:student_id], params['id'])
    redirect '/challenges/:id/stages/done' if !@stage
    erb :'/stages/index'
  end

  get '/challenges/:id/stages/done' do
    erb :'/stages/done'
  end

  post '/results' do
    Result.create(status: params[:status], stage_id: params[:stage_id], student_id: session[:student_id], challenge_id: params[:challenge_id])
    redirect "/challenges/#{params[:challenge_id]}/stages"
  end

  run! if app_file == $0
end
