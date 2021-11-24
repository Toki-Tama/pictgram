class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  #追記
  has_many :favorite_users, through: :favorites, source: 'user'
  #追記
  #追記
  has_many :comments
  has_many :comments_topics, through: :comments, source: 'topic'
  #追記
end
