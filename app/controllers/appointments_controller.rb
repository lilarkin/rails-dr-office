class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def new
    @doctors = Doctor.all.map { |d| [d.name, d.id] }
    @patients = Patient.all.map { |p| [p.full_name, p.id]}
    @appointment = Appointment.new
  end

  def show
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to :back, notice: 'Appointment was Created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to :back, notice: 'Appointment was Updated'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to :back, notice: 'Appointment was Deleted'
  end

  private
    def set_appointment 
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:doctor_id, :patient_id, :date, :time, :location)
    end
end
