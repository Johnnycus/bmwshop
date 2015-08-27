class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases, foreign_key: :buyer_id
  has_many :products, through: :purchases

  #def get_cart_items
  #  order_ids = @order_items.find(:product_id)
  #  Product.find(order_ids)
  #end

  #def purchase_cart_items!
  #  get_cart_items.each { |product| purchase(product) }
  #  cart.destroy
  #end

  #def purchase(product)
  #  products << product unless purchase?(product)
  #end

  #def purchase?(product)
  #  products.include?(product)
  #end

end
