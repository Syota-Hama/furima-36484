class Good < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payment
  belongs_to :Prefecture
  belongs_to :delivery
  has_one_attached :item_image

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :payment_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true }
  validates :item_image, presence: true, unless: :was_attached?

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

  def was_attached?
    self.item_image.attached?
  end
end
