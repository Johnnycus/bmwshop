class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :overview, presence: true, length: { minimum: 10, maximum: 250 }
  validates :description, presence: true

  has_attached_file :photo, styles: { preview: "280x171>" },
                    default_url:  "/assets/products/:id/:style/:basename.:extension",
                    path: ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
