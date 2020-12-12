class Post < ApplicationRecord
  belongs_to :author, optional: true

  validates_length_of :title, minimum: 5, maximum: 5, allow_blank: false
  validates :content, presence: true
  # validates :author, presence: true
end
