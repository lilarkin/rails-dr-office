class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty, :hospital

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
