class Product < ActiveRecord::Base

  has_attached_file :image

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :title, presence: true
  validates :description, presence: true
  validates :quantity, presence: true, numericality: true
  validates :min_price, presence: true, numericality: true
  validates :max_price, presence: true, numericality: true
  validates :start_price, presence: true, numericality: true
  validates :image_file_name, presence: true

  belongs_to :user
  has_many :orderitems
  before_create :set_current_price

private
  def set_current_price
    self.current_price = self.start_price if self.current_price.nil?
  end
end