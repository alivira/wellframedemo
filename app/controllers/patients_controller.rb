class PatientsController < ApplicationController
  before_filter :adminCheck, only: :index
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  def cmPatients
    @care_manager = CareManager.find(params[:id])
    @patients = @care_manager.patients
    render "care_managers/PatientList"
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def generateCode()
    require 'securerandom'
    return SecureRandom.hex
  end

  def create
    @patient = Patient.new(params[:patient])
    @patient.vcode = generateCode()
    @patient.active = false 
    @patient.care_manager_id = current_user.id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end



  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end


#API ROUTES
    def activatePatient
      @patient = Patient.find_by_vcode(params[:vcode])
      @patient.active = true
      @patient.save
    end

    def isValid
        render json: !Patient.find_by_vcode(params[:vcode]).nil?
    end


end
