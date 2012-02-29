class Message < ActiveRecord::Base
  has_many :comments

  validates :content, :presence => true
  serialize :tags
end