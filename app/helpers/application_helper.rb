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

  def edited?(comment)
    comment.created_at != comment.updated_at
  end

  def allowed_to_edit?(comment)
    hours_since_creation = (Time.zone.now - comment.created_at) / 3600
    hours_since_creation < 1
  end

  def show_modal?
    (cookies[:actions] % 5).zero?
  end
end
