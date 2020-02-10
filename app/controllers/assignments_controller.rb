class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def index
    @assignments = Assignment.all
  end

  def show
  end

  def new
    @assignment = Assignment.new
  end

  def edit
  end

  def create
    @assignment = Assignment.new(assignment_params)
      if @assignment.save
        flash[:success] = 'Assignment was successfully created.'
        redirect_to assignments_url
      else
        render :new 
      end
  end

  def update
      if @assignment.update(assignment_params)
        flash[:success] = 'Assignment was successfully updated.'
        redirect_to assignments_url 
      else
        render :edit 
      end
  end

  def destroy
    @assignment.destroy
    flash[:notice] = 'Assignment was successfully destroyed.'
      redirect_to assignments_url
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    def assignment_params
      params.require(:assignment).permit(:name, :description)
    end
end
