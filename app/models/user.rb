class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
