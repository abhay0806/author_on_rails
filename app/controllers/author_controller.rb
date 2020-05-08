class AuthorController < ApplicationController
	before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @author = Author.all
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find_by(params[:id])
  end

  def create
    @author = Author.create(author_params)
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to author_path, notice: "Successfully updated"
    else
      render :edit
    end

  def destroy
    @author.destroy
      flash[:notice] = "Author deleted"
    else
      flash[:error] = "Error destroying author"
    end
    redirect_back_or_default
  end

  private

  def set_author
    @author = Author.find_by(params[:id])
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_bitth)
  end
end
