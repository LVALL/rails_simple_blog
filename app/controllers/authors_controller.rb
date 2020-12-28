class AuthorsController < ApplicationController
  def show; end

  def new
    @author = Author.new
  end

  def edit; end

  def update
    if current_user.update(author_params)
      redirect_to author_path(current_user), notice: 'Profile was successfully updated.'
    else
      redirect_to author_path(current_user)
    end
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      redirect_to root_path, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end
