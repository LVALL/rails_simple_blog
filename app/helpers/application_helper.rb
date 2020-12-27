module ApplicationHelper
  def full_name(name)
    "#{name.first_name} #{name.last_name}"
  end

  def post_author?(current_author, post)
    return false if current_author.nil?

    true if current_author.id == post.author_id
  end

  def comment_author?(current_author, comment)
    return false if current_author.nil?

    true if current_author.id == comment.author_id
  end
end
