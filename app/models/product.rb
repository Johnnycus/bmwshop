class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :overview, presence: true, length: { minimum: 10, maximum: 250 }
  validates :description, presence: true
end
