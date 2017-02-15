class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def information
    "Appointment on #{date}, #{time}, at #{location}"
  end
end
