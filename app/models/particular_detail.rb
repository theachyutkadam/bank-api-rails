class ParticularDetail < ApplicationRecord
  belongs_to :particular
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
