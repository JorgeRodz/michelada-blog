class Post < ApplicationRecord
  has_rich_text :content

  validates :title, :content, presence: true
  validates :title, length: { maximum: 255 }
end
