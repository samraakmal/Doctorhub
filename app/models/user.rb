class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments
  belongs_to :doctor, optional: true
  enum user_type: { simple_user: 0, patient: 1, doctor: 2}
         
end
