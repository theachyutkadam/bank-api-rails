# frozen_string_literal: true

# == Schema Information
#
# Table name: cards
#
#  id          :uuid             not null, primary key
#  active_at   :datetime
#  blocked_at  :datetime
#  closed_at   :datetime
#  csv         :integer          not null
#  deleted_at  :datetime
#  expire_date :datetime         not null
#  inactive_at :datetime
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
#  index_cards_on_deleted_at   (deleted_at)
#  index_cards_on_number       (number) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :number, :expire_date, :csv, :customer_id, :status, :is_deleted, :pin, :customer

  def expire_date
    object.expire_date.to_fs(:long)
  end

  def customer
    ActiveModelSerializers::SerializableResource.new(object.customer, each_serializer: CustomerSerializer)
  end
end
