class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :delivery_days
  belongs_to :user
  has_one :user_item
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1, message: "を入力してください"}
    validates :status_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :fee_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :delivery_days_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数値で入力してください' }
  end
  validates_inclusion_of :price, { in: 300..9_999_999, message: 'は¥300〜9,999,999の間で設定してください' }
end
