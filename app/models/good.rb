class Good < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :payment
  belongs_to :Prefecture
  belongs_to :delivery
  has_one_attached :item_image

  validates :items_name, presence: true, length: { in: 1..40 }
  validates :items_explanation, presence: true, length: { in: 1..1_000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :payment_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, message: "can't be blank" }
  validates :item_image, presence: true
  validates :price, inclusion: { in: 300..9_999_999 }

end
