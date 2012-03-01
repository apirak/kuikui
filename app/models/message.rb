class Message < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :content, :presence => true
  serialize :tags

  def create_tag
    self.tags = content.scan(/#[A-Za-z0-9_]+/)
  end

  def user_name
    user ? "@#{user.name}" : "anonymous"
  end

end