# == Schema Information
#
# Table name: addresses
#
#  id          :bigint           not null, primary key
#  building    :string
#  description :text
#  flat_number :string
#  pin_code    :string
#  street      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
