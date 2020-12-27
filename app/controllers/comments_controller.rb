class CommentsController < ApplicationController
  before_action :set_post, only: %i[create edit publish destroy]
  before_action :authorize, only: %i[create destroy update publish]

  def create
    @comment = @post.comments.create(comment_params.merge(author_id: current_user.id))
    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Comment was successfully updated.'
    else
      redirect_to post_path(@post)
    end
  end

  def publish
    @comment = @post.comments.find(params[:comment_id])
    @comment.update(status: :published)
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
