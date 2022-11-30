# == Schema Information
#
# Table name: particular_details
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  particular_id :bigint           not null
#  receiver_id   :bigint           not null
#  sender_id     :bigint           not null
#
# Indexes
#
#  index_particular_details_on_particular_id  (particular_id)
#  index_particular_details_on_receiver_id    (receiver_id)
#  index_particular_details_on_sender_id      (sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (particular_id => particulars.id)
#  fk_rails_...  (receiver_id => users.id)
#  fk_rails_...  (sender_id => users.id)
#
class ParticularDetail < ApplicationRecord
  belongs_to :particular
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
end
