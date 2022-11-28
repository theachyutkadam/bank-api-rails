class ParticularDetail < ApplicationRecord
  belongs_to :particular
  belongs_to :sender
  belongs_to :receiver
end
