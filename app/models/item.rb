class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :delivery_days
  has_one_attached :image

  validates :category_id, numericality:{ other_than: 1, message: "cant't be blank"}
end
