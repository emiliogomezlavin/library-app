class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was succesfully created!"
      login(@user)
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.join(', ')
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end


  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end


end
