# == Schema Information
#
# Table name: nominees
#
#  id          :uuid             not null, primary key
#  contact     :string           not null
#  first_name  :string           not null
#  gender      :integer          not null
#  last_name   :string           not null
#  middle_name :string           not null
#  relation    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid             not null
#
# Indexes
#
#  index_nominees_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class NomineeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name, :contact, :gender, :relation, :customer_id
end
