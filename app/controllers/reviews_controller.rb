class ReviewsController < ApplicationController
    before_action :authorize_request
    before_action :load_property, only: [:create, :destroy]
    before_action :load_review, only: [:edit, :update, :destroy]
  
    # POST /properties/:property_id/reviews
    def create
      @review = @property.reviews.build(review_params)
      @review.user = current_user
  
      if @review.save
        render json: @review, status: :created
      else
        render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # GET /reviews/:id/edit
    def edit
      render json: @review
    end
  
    # PATCH/PUT /reviews/:id
    def update
      if @review.update(review_params)
        render json: @review
      else
        render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /properties/:property_id/reviews/:id
    def destroy
      @review.destroy
      head :no_content
    end
  
    private
  
    def review_params
      params.require(:review).permit(:name, :body)
    end
  
    def load_property
      @property = Property.find(params[:property_id])
    end
  
    def load_review
      @review = Review.find(params[:id])
    end
end
  