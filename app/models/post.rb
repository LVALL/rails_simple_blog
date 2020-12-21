class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy

  after_initialize do
    self.views_counter ||= 0 if new_record?
  end

  validates_length_of :title, minimum: 5, maximum: 20, allow_blank: false
  validates :content, presence: true
end
