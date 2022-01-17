class Address < ApplicationRecord

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :municipalitis
    validates :address
    validates :telephone_number
    validates :order
  end

  belongs_to :order
end
