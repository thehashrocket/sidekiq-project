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
require "test_helper"

class ShortUrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
