class InquiriesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @inquiries = Inquiry.all
  end

  def new
    @user = current_user
    @inquiry = @user.inquiries.new
  end

  def create
    @user = current_user
    @inquiry = @user.inquiries.build(params[:inquiry])

    if @inquiry.save
      redirect_to @inquiry, notice: "Great jorb. You made an inquiry."
    else
      redirect_to new_inquiry_path, notice: "Oops. Looks like ya done fucked up."
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def edit
    @inquiry = Inquiry.find(params[:id])
  end

  def update
    @inquiry = Inquiry.find(params[:id])

    if @inquiry.update_attributes(params[:inquiry])
      redirect_to inquiry_path(@inquiry), notice: "Good jorb. Ya updated."
    else
      redirect_to inquiry_path(@inquiry), notice: "Whoops, looks like ya done messed up."
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])

    if @inquiry.delete
      redirect_to inquiries_path, notice: "Inquiry deleted."
    else
      redirect_to inquiries_path, notice: "There was a problem deleting your inquiry."
    end
  end
end
