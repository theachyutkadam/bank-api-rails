# == Schema Information
#
# Table name: nominees
#
#  id          :bigint           not null, primary key
#  contact     :string
#  first_name  :string
#  gender      :integer
#  last_name   :string
#  middle_name :string
#  relation    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_nominees_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#
