class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :user

  validates :message_id, :presence => true

  def user_name
    user ? "@#{user.name}" : "anonymous"
  end

end
