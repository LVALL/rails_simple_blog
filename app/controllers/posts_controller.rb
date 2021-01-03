class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authorize, except: %i[index show]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments.roots
    @comment = @post.comments.build
    @post.increment!(:views_counter)
  end

  def new
    @post = Post.new
  end

  def search
    @posts = Post.where('title ILIKE ?', "%#{params[:q]}%")
    render :index
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :title, :content, :image)
  end
end
