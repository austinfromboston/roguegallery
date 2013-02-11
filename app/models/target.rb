class Target < ActiveRecord::Base
  extend FriendlyId
  attr_accessible :url

  before_validation :generate_shorturl, on: :create
  validates :shorturl, presence: true, uniqueness: true
  friendly_id :shorturl

  def generate_shorturl
    self.shorturl = SecureRandom.urlsafe_base64(6)
  end
end
