class Request < ActiveRecord::Base

  belongs_to :user
  has_many :replies, dependent: :destroy
  before_create :set_expiration_date

  validates_presence_of :user

  def set_expiration_date
    if self.replies.any?
      self.expiration =  Date.today + 1000.days
    else
      self.expiration =  Date.today + 5.days
    end
  end

  def build_reply(attributes = {}, user)
    attributes[:user] ||= user
    replies.build(attributes)
  end

end
