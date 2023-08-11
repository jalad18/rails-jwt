class CasesController < ApplicationController
  before_action :authorize_request, except: %i[index show]
  before_action :find_case, only: [:show, :edit, :update, :destroy]

  def index
    @cases = Case.all
    render json: @cases, status: :ok
  end

  def show
    render json: @case, status: :ok
  end

  def edit
  end

  def create
    @case = Case.new(set_params)
    @case.user = @current_user 

    if @case.save
      render json: @case, status: :created
    else
      render json: { errors: @case.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @case.update(set_params)
      render json: @case, status: :ok
    else
      render json: { errors: @case.errors.full_messages },status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:case).permit(:case_name, :case_no, :case_description, :case_status, :court_name, :filing_date, :case_category, :additional_notes, :Hearing_date)
  end

  def find_lawyer_detail
    @case = Case.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'case not found' }, status: :not_found
  end
end
