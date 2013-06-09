class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: "You successfully created a user"
    else
      render "new", notice: "Your user didn't save. Idiot."
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def destroy
    @user = User.find(params[:id])
    if @user.delete
      redirect_to users_path, notice: "User delorted"
    else
      redirect_to users_path, notice: "User not delorted"
    end
  end
end
