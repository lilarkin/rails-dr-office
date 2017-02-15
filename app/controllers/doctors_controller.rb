class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor, notice: 'Doctor was Created'
    else
      render :new
    end
  end 

  def edit
  end

  def update 
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: 'Doctor was Updated'
    else
      render :edit
    end
  end

  def destroy 
    @doctor.destroy
    redirect_to :root, notice: 'Doctor was Deleted'
  end

  private
    def set_doctor 
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params 
      params.require(:doctor).permit(:name, :specialty, :hospital)
    end
end
