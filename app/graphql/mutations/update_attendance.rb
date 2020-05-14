# frozen_string_literal: true

module Mutations
  # TODO: Handle polymorphic association
  class UpdateAttendance < BaseMutation
    field :attendance, Types::AttendanceType, null: true
    field :errors, String, null: true

    argument :attendable_id, Integer, required: true
    argument :attendable_type, String, required: true
    argument :training_id, Integer, required: true
    argument :session_date, GraphQL::Types::ISO8601DateTime, required: true
    argument :presence, Boolean, required: true

    def resolve(attendable_id:, attendable_type:, training_id:, session_date:, presence:)
      if Date.today > session_date
        { errors: [I18n.t(:invalid_attendance_update, scope: :custom_errors, default: nil)] }
      else
        attendance = Attendance.find_or_create_by(
          attendable_id:   attendable_id,
          attendable_type: attendable_type,
          training_id:     training_id,
          session_date:    session_date
        )

        attendance.update(presence: presence)

        { attendance: attendance }
      end
    end
  end
end
