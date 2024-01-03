class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_one_attached :image
end
