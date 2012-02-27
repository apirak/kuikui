class Message < ActiveRecord::Base
  validates :content, :presence => true
  serialize :tags
end