class UserInformationSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name, :contact, :gender, :birth_date, :pan_card_number, :adhaar_card_number, :is_handicap, :handicap_details, :maritial_status, :user
end
