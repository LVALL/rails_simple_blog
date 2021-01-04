class CommentVotesController < ApplicationController
  before_action :authorize
  before_action :find_comment

  def like
    if already_voted?
      flash[:notice] = "You can't vote more than once"
    else
      @comment.author_comment_votes.create(author_id: current_user.id, vote_value: 'liked')
    end
    redirect_to post_path(@comment.post)
  end

  def dislike
    if already_voted?
      flash[:notice] = "You can't vote more than once"
    else
      @comment.author_comment_votes.create(author_id: current_user.id, vote_value: 'disliked')
    end
    redirect_to post_path(@comment.post)
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def already_voted?
    AuthorCommentVote.where(author_id: current_user.id, comment_id: params[:comment_id]).exists?
  end
end
