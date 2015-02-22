class HospitalsController < ApplicationController
  def index
    if !params[:search].blank?
      @hospitals = Hospital.where("name LIKE ?", "%#{params[:search]}%")
    else
      @hospitals = Hospital.paginate(:page => params[:page], :per_page => 5)
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @hospital = Hospital.new
    respond_to do |format|
      format.js
    end    
  end

  def create
    @hospital = Hospital.create hospital_params
    @hospitals = Hospital.all
    respond_to do |format|
      format.js
    end
    redirect_to hospitals_path
  end

  def destroy
    @hospital = Hospital.find params[:id]
    @hospital.destroy
    respond_to do |format|
      format.js { render nothing: true }
    end
  end


private
  def hospital_params
    # {hospital: { name: "asdf"}}
    params.require(:hospital).permit(
      :name,
      :location
    )
  end  
end
