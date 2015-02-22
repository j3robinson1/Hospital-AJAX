class PatientsController < ApplicationController
  def index
    set_hospital
    if !params[:search].blank?
      @patients = Patient.where("firstName LIKE ?", "%#{params[:search]}%")
    else
      @patients = Patient.paginate(:page => params[:page], :per_page => 5)
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    set_hospital
    @patient = Patient.new
    respond_to do |format|
      format.js
    end    
  end

  def create
    set_hospital
    @patient = @hospital.patients.create patient_params
    @patients = Patient.all
    respond_to do |format|
      format.js
    end
    redirect_to hospital_patients_path(@hospital)
  end

  def destroy
    @patient = Patient.find params[:id]
    @patient.destroy
    respond_to do |format|
      format.js { render nothing: true }
    end
  end


private
  def patient_params
    params.require(:patient).permit(
      :firstName,
      :lastName,
      :hospital_id
    )
  end  
  def set_hospital
    @hospital = Hospital.find params[:hospital_id]
  end
end
