class Product < ActiveRecord::Base
  has_many :order_items

  validates :name, presence: true
  validates :price, presence: true
  validates :overview, presence: true, length: { minimum: 10, maximum: 250 }
  validates :description, presence: true

  has_attached_file :photo

  validates_attachment_presence :photo
  validates_attachment_content_type :photo, content_type: ['image/jpeg', 'image/png']
end
