class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
    3.times { @survey.questions.build }
  end

  def create
    @survey = Survey.new(params[:survey])
    @questions
    if @survey.save
      render :index, alert: "Your survey was successfully created"
    else
      render :new, alert: "Your survey was successfully created"
    end
  end
end
