class Request < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :online_or_offline, presence: true, length: { maximum: 1 }
  validates :prefecture, length: { maximum: 50 }
  validates :station, length: { maximum: 50 }
  
  has_many :messages, dependent: :delete_all
end
