class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  belongs_to :good
  has_one :address
end
