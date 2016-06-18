class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    current_user
    render :index
  end

  def new
    @library = Library.new
    render :new
  end

  def create
    @library = Library.new(library_params)
    if @library.save
      flash[:notice] = "Library saved!"
      redirect_to @library
    else
      flash[:errors] = @library.errors.full_messages.join(', ')
      redirect_to new_library_path
    end
  end

  def show
    @library = Library.find(params[:id])
    render :show
  end

  private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end

end
