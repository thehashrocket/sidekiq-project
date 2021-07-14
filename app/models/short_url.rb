# == Schema Information
#
# Table name: short_urls
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE)
#  description :string
#  long_url    :string
#  short_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_short_urls_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ShortUrl < ApplicationRecord
  validates :long_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates_length_of :long_url, within: 3..255, on: :create, message: 'too long'
  validates :long_url, uniqueness: { scope: :user_id }
  before_create :shorten_url
  belongs_to :user

  private

  def shorten_url
    self.short_url = rand(36**8).to_s(36)
  end
end
