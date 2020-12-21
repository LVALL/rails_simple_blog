class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy

  validates_length_of :title, minimum: 5, maximum: 20, allow_blank: false
  validates :content, presence: true
end
