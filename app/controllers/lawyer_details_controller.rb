class LawyerDetailsController < ApplicationController
  before_action :authorize_request
  before_action :find_lawyer_detail, only: [:show, :edit, :update]

  def index
    @lawyer_details = LawyerDetail.all
    render json: @lawyer_details, status: :ok
  end

  def show
    render json: @lawyer_detail, status: :ok
  end

  def edit
  end

  def create
    @lawyer_detail = LawyerDetail.new(set_params)
    @lawyer_detail.user = @current_user 

    if @lawyer_detail.save
      render json: @lawyer_detail, status: :created
    else
      render json: { errors: @lawyer_detail.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    unless @lawyer_detail.update(set_params)
      render json: { errors: @lawyer_detail.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:lawyer_detail).permit(:license_no, :practice_court_name, :practice_field_name, :experience, :city, :consultation_fees)
  end

  def find_lawyer_detail
    @lawyer_detail = LawyerDetail.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Lawyer Detail not found' }, status: :not_found
  end
end
