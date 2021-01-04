class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author
  has_many :author_comment_votes, dependent: :destroy

  has_ancestry

  enum status: %i[published unpublished]
  after_initialize do
    self.status ||= :published if new_record?
  end

  scope :published_comment, -> { where(status: :published) }
  scope :unpublished_comment, -> { where(status: :unpublished) }

  validates :body, presence: true
end
