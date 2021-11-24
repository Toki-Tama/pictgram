class Comment < ApplicationRecord
  belongs_to :user 
  belongs_to :topic
  #ここから追加 11/11#
  validates :description, presence: true
  validates :topic_id, presence: true
  #ここまで#
end
