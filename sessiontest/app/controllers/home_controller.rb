class HomeController < ApplicationController
  def index
    @seconds = Time.now.to_i - session[:last_time].to_i
    @last_time = session[:last_time]
    session[:last_time] = Time.now

  end
end
