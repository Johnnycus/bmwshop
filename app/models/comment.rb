class Comment < ActiveRecord::Base
  validates :text, presence: true, length: { minimum: 5, maximum: 1000 }
end
