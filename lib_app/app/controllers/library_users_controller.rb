class LibraryUsersController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @user_libraries = @user.libraries
    @libraries = Library.all
    render :index
  end

  def create
    @user = @current_user
    p @user
    @library = Library.find(params[:library_id])
    p @library
    if @user.libraries.push(@library)
      redirect_to user_libraries(@user)
    else
      redirect_to library_users(@library)
    end
  end

end
