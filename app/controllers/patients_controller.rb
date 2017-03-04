class PatientsController < ApplicationController
  def index
    if params[:search].present?
      @patients = Patient.search(params[:search])
    else
      @patients = Patient.all
    end
  end

  def create
    if Patient.create(patient_params)
      flash[:notice] = "Paciente creado correctamente"
      redirect_to :root
    else
      flash[:alert] = "No se ha podido crear el paciente"
      redirect_to :new
    end
  end

  def edit
    @patient = patient
  end

  def show
    @patient = patient
  end

  def update
    if patient.update(patient_params)
      flash[:notice] = "Paciente actualizado correctamente"
      redirect_to :root
    else
      flash[:alert] = "No se ha podido actualizar el paciente"
      redirect_to :edit
    end
  end

  def new
    @patient = Patient.new
  end

  private

  def patient
    Patient.find params[:id]
  end

  def patient_params
    params.require(:patient).permit!
  end
end
