module Mutations
  # TODO: Handle polymorphic association
  class UpdateAttendance < BaseMutation
    argument :attendable_id, Integer, required: true
    argument :attendable_type, String, required: true
    argument :training_id, Integer, required: true
    argument :session_date, GraphQL::Types::ISO8601DateTime, required: true
    argument :presence, Boolean, required: true

    type Types::AttendanceType

    def resolve(attendable_id:, attendable_type:, training_id:, session_date:, presence:)
      attendance = Attendance.find_or_create_by(
        attendable_id:   attendable_id,
        attendable_type: attendable_type,
        training_id:     training_id,
        session_date:    session_date
      )

      attendance.update(presence: presence)
      attendance
    end
  end
end
