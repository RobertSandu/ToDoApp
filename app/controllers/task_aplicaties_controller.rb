class TaskAplicatiesController < ApplicationController
  before_action :set_task_aplicaty, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:show, :edit, :update, :destroy, :create, :index, :new]

  # GET /task_aplicaties
  # GET /task_aplicaties.json
  def index
    @task_aplicaties = TaskAplicatie.all
  end

  # GET /task_aplicaties/1
  # GET /task_aplicaties/1.json
  def show
  end

  # GET /task_aplicaties/new
  def new
    @task_aplicaty = TaskAplicatie.new
  end

  # GET /task_aplicaties/1/edit
  def edit
  end

  # POST /task_aplicaties
  # POST /task_aplicaties.json
  def create
    @task_aplicaty = TaskAplicatie.new(task_aplicaty_params)

    respond_to do |format|
      if @task_aplicaty.save
        format.html { redirect_to @task_aplicaty, notice: 'Task aplicatie was successfully created.' }
        format.json { render :show, status: :created, location: @task_aplicaty }
      else
        format.html { render :new }
        format.json { render json: @task_aplicaty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_aplicaties/1
  # PATCH/PUT /task_aplicaties/1.json
  def update
    respond_to do |format|
      if @task_aplicaty.update(task_aplicaty_params)
        format.html { redirect_to @task_aplicaty, notice: 'Task aplicatie was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_aplicaty }
      else
        format.html { render :edit }
        format.json { render json: @task_aplicaty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_aplicaties/1
  # DELETE /task_aplicaties/1.json
  def destroy
    @task_aplicaty.destroy
    respond_to do |format|
      format.html { redirect_to task_aplicaties_url, notice: 'Task aplicatie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_aplicaty
      @task_aplicaty = TaskAplicatie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_aplicaty_params
      params.require(:task_aplicatie).permit(:title, :description, :completed, :startDate, :endDate)
    end
end
