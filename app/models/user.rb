class User < ApplicationRecord
  belongs_to :address
  belongs_to :accountable, polymorphic: true

  enum gender: { male: 0, female: 1, transgender: 2 }
  enum maritial_status: { single: 0, married: 1, devorsed: 2 }
end
