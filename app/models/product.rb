class Product < ActiveRecord::Base

  has_attached_file :image

  belongs_to :user
  has_many :orders
  
end
