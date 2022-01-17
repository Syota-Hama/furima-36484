class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :user_id, :post_code, :good_id, :prefecture_id, :municipalitis, :address, :telephone_number, :order_id, :building_name 

  VALID_POST_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
  VALID_TELEPHONE_NUMBER_REGEX = /0[0-9]{9,10}/

  with_options presence: true do
    validates :post_code, format: { with: VALID_POST_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalitis
    validates :address
    validates :telephone_number, format: { with: VALID_TELEPHONE_NUMBER_REGEX }
    validates :user_id
    validates :good_id
  end

  def save
    order = Order.create(user_id: user_id, good_id: good_id)

    addresses = Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalitis: municipalitis, 
                             address: address, telephone_number: telephone_number, order_id: order.id, building_name: building_name)
  end
end