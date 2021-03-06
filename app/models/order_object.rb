class OrderObject
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めた半角文字列で入力してください (例：123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{10,11}+\z/, message: '10桁以上11桁以内の半角数値で入力してください' }
    validates :token
  end

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building,
                   phone_number: phone_number, user_item_id: user_item.id)
  end
end
