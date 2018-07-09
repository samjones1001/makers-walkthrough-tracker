ENV['RACK_ENV']||='dev'

require 'sinatra/base'

require_relative 'data_mapper_setup'
require_relative './lib/cohort'
require_relative './lib/student'
require_relative './lib/challenge'


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
    @challenges = Challenge.all
    erb :'challenges/index'
  end

  run! if app_file == $0
end
