class Product < ActiveRecord::Base

  has_attached_file :image

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :title, :description, :image_file_name, presence: true
  validates :quantity, :min_price, :max_price, :start_price, presence: true, numericality: true

  belongs_to :user
  has_many :orderitems
  before_create :set_last_sale

  def update_quantity(quantity)
    self.quantity_sold += quantity
    self.save!
  end

  def update_last_sold_price(price)
    self.last_sold_price = price
    self.last_sale_time = DateTime.now
    self.save!
  end

  def current_price
    increase_factor = 1.05
    decrease_factor = 1.01
    decrease_period = 60  # in minutes
    periods_since_start = (Time.now - self.created_at)/decrease_period.minute
    return [[self.start_price * (increase_factor**self.quantity_sold) / (decrease_factor**periods_since_start), self.min_price].max, self.max_price].min
  end

private
  def set_last_sale
    self.last_sold_price = self.start_price if self.last_sold_price.nil?
    self.last_sale_time = DateTime.now
    self.quantity_sold = 0
  end
end