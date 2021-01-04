class AuthorCommentVote < ApplicationRecord
  belongs_to :author
  belongs_to :comment

  enum vote_value: %i[default liked disliked]
  after_initialize do
    self.vote_value ||= :default if new_record?
  end

  scope :liked_comment, -> { where(vote_value: :liked) }
  scope :disliked_comment, -> { where(vote_value: :disliked) }
end
