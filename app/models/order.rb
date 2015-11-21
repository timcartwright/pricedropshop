class Order < ActiveRecord::Base
  
  has_many :orderitems
  belongs_to :user

  def mark_as_paid
    self.paid = true
    self.save
  end

end
