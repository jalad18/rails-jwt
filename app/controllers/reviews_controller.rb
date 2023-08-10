class ReviewsController < ApplicationController
    before_action :authorize_request 
    def create
      @lawyer_detail = LawyerDetail.find(params[:lawyer_detail_id])
      @review = @lawyer_detail.reviews.new(review_params)
      @review.user = current_user
      if @review.save
        render json: @review, status: :created
      else
        render json: { errors: @review.errors.full_messages },status: :unprocessable_entity
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:rating, :content, :lawyer_detail_id)
    end
end
