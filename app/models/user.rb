# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(TRUE)
#  password_digest :string
#  token           :string
#  email           :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many :short_urls
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }
  before_create :generate_user_token

  private

  def generate_user_token
    self.token = generate_token
  end

  def generate_token
    loop do
      token = SecureRandom.hex(10)
      break token unless User.where(token: token).exists?
    end
  end
end
