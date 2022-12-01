# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  accountable_type :string
#  deleted_at       :datetime
#  email            :string
#  is_admin         :boolean
#  password         :string
#  status           :integer
#  username         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  accountable_id   :integer
#
