class CareManagersController < ApplicationController
  before_filter :adminCheck, only: [:edit, :update, :destroy, :new, :create]



  def new
    @caremanager = CareManager.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caremanager }
    end
  end

  def edit
    @caremanager = CareManager.find(params[:id])
  end

  def index
    @caremanagers = current_user.hospital.care_managers

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @caremanagers }
    end
  end

  

  def show
    @caremanager = CareManager.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @caremanager }
    end
  end

  def destroy
    @caremanager = CareManager.find(params[:id])
    @caremanager.destroy

    respond_to do |format|
      format.html { redirect_to care_managers_url }
      format.json { head :no_content }
    end
  end

  def create
    @caremanager = CareManager.new(params[:care_manager])
    @caremanager.hospital_id = current_user.hospital_id

    respond_to do |format|
      if @caremanager.save
        format.html { redirect_to @caremanager, notice: 'Care Manager was successfully created.' }
        format.json { render json: @caremanager, status: :created, location: @caremanager }
      else
        format.html { render action: "new" }
        format.json { render json: @caremanager.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @caremanager = CareManager.find(params[:id])

    respond_to do |format|
      if @caremanager.update_attributes(params[:care_manager])
        format.html { redirect_to @caremanager, notice: 'Care Manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @caremanager.errors, status: :unprocessable_entity }
      end
    end
  end

  def makeAdmin
    @caremanager = CareManager.find(params[:id])
    @caremanager.admin=true
    @caremanager.save
    redirect_to care_managers_url
  end

  
#API ROUTES
  def activePatientCount
   render json: CareManager.find_by_email(params[:email]).patients.where(active: true).length 
  end

  def activePatientList
    return CareManager.find_by_email(params[:email]).patients.where(active: true).length
  end

end
