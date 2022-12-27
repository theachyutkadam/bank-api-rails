# == Schema Information
#
# Table name: cards
#
#  id          :bigint           not null, primary key
#  csv         :integer          not null
#  expire_date :datetime         not null
#  is_deleted  :boolean
#  number      :bigint           not null
#  pin         :integer          not null
#  status      :integer          not null
#  title       :string           not null
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
class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :number, :expire_date, :csv, :customer, :status, :is_deleted, :pin

  def expire_date
    object.expire_date.to_fs(:long)
  end

  def customer
    ActiveModelSerializers::SerializableResource.new(object.customer, each_serializer: CustomerSerializer)
  end
end
