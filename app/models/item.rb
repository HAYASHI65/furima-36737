class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :delivery_days
  has_one_attached :image

  
  with_options presence:true do
    validates :name
    validates :text
    validates :category_id, numericality:{ other_than: 1, message: "cant't be blank"}
    validates :status_id
    validates :fee_id
    validates :prefecture_id
    validates :delivery_days_id
    validates :price, format: { with: /\A[0-9]+\z/}
  end 
  validates_inclusion_of :price, in:300..9999999
end
