# == Schema Information
#
# Table name: cards
#
#  id          :uuid             not null, primary key
#  csv         :integer          not null
#  expire_date :datetime         not null
#  is_deleted  :boolean
#  number      :bigint           not null
#  pin         :integer          not null
#  status      :integer          default("inactive"), not null
#  title       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :uuid             not null
#
# Indexes
#
#  index_cards_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :number, :expire_date, :csv, :customer_id, :status, :is_deleted, :pin

  def expire_date
    object.expire_date.to_fs(:long)
  end

  # def customer
  #   ActiveModelSerializers::SerializableResource.new(object.customer, each_serializer: CustomerSerializer)
  # end
end
