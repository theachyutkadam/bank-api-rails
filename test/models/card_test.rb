# == Schema Information
#
# Table name: cards
#
#  id          :bigint           not null, primary key
#  csv         :integer
#  expire_date :datetime
#  is_active   :boolean
#  is_deleted  :boolean
#  number      :bigint
#  pin         :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_cards_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
require "test_helper"

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
