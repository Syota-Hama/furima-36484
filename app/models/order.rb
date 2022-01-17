class Order < ApplicationRecord

  with_options presence: ture do
    validates :user
    validates :good
  end
  
  belongs_to :user
  belongs_to :good
  has_one :address

end
