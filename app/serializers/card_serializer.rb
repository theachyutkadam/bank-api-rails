class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :number, :expire_date, :csv, :customer, :status, :is_deleted, :pin
end
