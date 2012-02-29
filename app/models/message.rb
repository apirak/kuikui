class Message < ActiveRecord::Base
  has_many :comments

  validates :content, :presence => true
  serialize :tags

  after_save :create_tag

  def create_tag
    self.tags = content.scan(/#[A-Za-z0-9_]+/)
  end

end