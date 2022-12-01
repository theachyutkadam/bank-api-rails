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
class Address < ApplicationRecord
  has_one :customer
  has_one :employee
end
