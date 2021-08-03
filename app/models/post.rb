class Post < ApplicationRecord
  belongs_to :user
  acts_as_likeable
  
  validates :images, presence: true
  
  mount_uploaders :images, ImageUploader
  serialize :images, JSON

end
