class Post < ApplicationRecord
  belongs_to :author, optional: true
  has_many :comments

  validates_length_of :title, minimum: 5, maximum: 20, allow_blank: false
  validates :content, presence: true
  validates :author_name, presence: true
end
