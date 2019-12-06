class Appointment < ApplicationRecord
	belongs_to :user
	belongs_to :doctor, class_name: "User", foreign_key: "doctor_id"
	enum status: {pending: 0, approved: 1, rejected: 2}
end
