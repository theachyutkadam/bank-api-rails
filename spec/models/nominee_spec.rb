# == Schema Information
#
# Table name: nominees
#
#  id          :uuid             not null, primary key
#  contact     :string           not null
#  deleted_at  :datetime
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
#  index_nominees_on_deleted_at   (deleted_at)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
