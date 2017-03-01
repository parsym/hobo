class Api::V1::ChecksSerializer < Api::V1::BaseSerializer
  attributes :id, :user_id, :room_information_id, :start_date, :end_date, :discount, :total_amount, :created_at, :updated_at

  belongs_to :room_information
  belongs_to :user
  has_many :book_refs

  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end
