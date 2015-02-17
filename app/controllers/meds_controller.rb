class MedsController < ApplicationController
  def index
    set_hospital
    set_patient
    @meds = Med.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    set_hospital
    set_patient
    @med = Med.new
    respond_to do |format|
      format.js
    end    
  end

  def create
    set_hospital
    set_patient
    @med = @patient.meds.create med_params
    @meds = Med.all
    respond_to do |format|
      format.js
    end
    redirect_to hospital_meds_path(@hospital)
  end

  def destroy
    @med = Med.find params[:id]
    @med.destroy
    respond_to do |format|
      format.js { render nothing: true }
    end
  end


private
  def med_params
    params.require(:med).permit(
      :name,
      :direction,
      :hospital_id,
      :patient_id
    )
  end 
  def set_patient
    @patient = Patient.find params[:patient_id]
  end
  def set_hospital
    @hospital = Hospital.find params[:hospital_id]
  end
end
