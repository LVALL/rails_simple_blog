class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author

  enum status: %i[published unpublished]
  after_initialize do
    self.status ||= :unpublished if new_record?
  end

  validates :body, presence: true
end
