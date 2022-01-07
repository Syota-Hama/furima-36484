class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }

  validates :status_id, numericality: { other_than: 1 , message: "can't be blank" }
end
