class Address < ApplicationRecord

  VALID_POST_CODE_REGEX = \A\d{3}[-]?\d{4}\z
  VALID_TELEPHONE_NUMBER_REGEX = 0[0-9]{9,10}

  with_options presence: true do
    validates :post_code, format: { with: VALID_POST_CODE_REGEX }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalitis
    validates :address
    validates :telephone_number, format: { with: VALID_TELEPHONE_NUMBER_REGEX }
    validates :order
  end

  belongs_to :order
end
