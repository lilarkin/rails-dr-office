class Patient < ApplicationRecord
  validates_presence_of :first_name, :last_name, :age, :gender
  validates_inclusion_of :gender, in: ['Male', 'Female', 'Other']

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  def full_name
    "#{first_name} #{last_name}"
  end
end
