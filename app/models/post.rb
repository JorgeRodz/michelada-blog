class Post < ApplicationRecord
  has_rich_text :content
  has_many :comments

  validates :title, :content, presence: true
  validates :title, length: { maximum: 255 }
end
