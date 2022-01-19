class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :post_code, :good_id, :prefecture_id, :municipalitis, :address, :telephone_number,
                :building_name, :token

  VALID_TELEPHONE_NUMBER_REGEX = /\A[0-9]{10,11}\z/

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalitis
    validates :address
    validates :telephone_number, format: { with: VALID_TELEPHONE_NUMBER_REGEX, message: 'Telephone number is invalid' }
    validates :user_id
    validates :good_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, good_id: good_id)

    addresses = Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalitis: municipalitis,
                               address: address, telephone_number: telephone_number, order_id: order.id, building_name: building_name)
  end
end
