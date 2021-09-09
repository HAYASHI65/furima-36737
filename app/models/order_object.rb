class OrderObject
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
    validates :user_item_id
  end

  def save
    user_item = User_item.create(user_id: current_user.id, item_id: @item.id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, user_item_id: user_item.id)
  end
end