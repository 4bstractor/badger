class Invite < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :bill
  belongs_to :user
  belongs_to :inviter, :class_name => 'User'

  validate :expire

  private

  EXPIRE_TIMEOUT = 2.weeks.ago

  def expire
    # Check if the invite is too old and expire it if it is
    if created_at && (created_at - EXPIRE_TIMEOUT) < 0
      update_attributes(:expired => true)
    end
  end
end
