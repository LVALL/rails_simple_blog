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

  validate :limit_depth
  validates :body, presence: true

  private

  def limit_depth
    errors.add(:comment, 'Maximum level of nested comments is 5') if depth >= 6
  end
end
