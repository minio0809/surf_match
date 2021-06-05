class Post < ApplicationRecord
  belongs_to :user
  acts_as_likeable
  
  mount_uploaders :images, ImageUploader
  serialize :images, JSON

end
