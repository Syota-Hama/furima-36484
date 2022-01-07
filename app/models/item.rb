class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :stasus
  belongs_to :peyment
  belongs_to :Prefecture
  belongs_to :delivery

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :payment_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank" }

end
