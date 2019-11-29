class Appointment < ApplicationRecord
	belongs_to :user
	enum status: {Pending: 0, Approved: 1,Rejected: 2}
end
