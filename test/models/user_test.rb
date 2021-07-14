# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(TRUE)
#  email           :string
#  password_digest :string
#  token           :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
