class Message < ApplicationRecord
  belongs_to :user
  belongs_to :request
  
  validates :content, presence: true, length: { maximum: 255 }
end
