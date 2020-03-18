class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: true }
  has_secure_password
  
  has_many :requests
  has_many :messages
  has_many :oubos, through: :messages, source: :request
  
  def oubo(a_req)
    self.messages.create(request_id: a_req.id)
  end
end