require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) { FactoryBot.attributes_for(:user) }
  let(:invalid_attributes) { { name: nil } }

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect {
          post :create, params: valid_attributes
        }
      end
    end
  end

  describe "POST #create" do
    context "with invalid attributes" do
      it "creates a new user" do
        expect {
          post :create, params: invalid_attributes
        }
      end
    end
  end

  describe "PATCH#update" do
    context "with valid attributes" do
      it "creates a new user" do
        expect {
          patch :update, params: valid_attributes
        }
      end
    end
  end

  describe "POST #login" do
    context "with valid credentials" do
      it "logs in the user and returns authentication token" do
        # Create a user for this example
        user = FactoryBot.create(:user)

        # Perform a POST request to the login action with user's credentials
        post :login, params: { email: user.email, password: user.password }

        # Expectations...
      end
    end

    context "with invalid credentials" do
      it "returns unauthorized" do
        # Perform a POST request to the login action with incorrect credentials
        post :login, params: { email: "invalid@example.com", password: "wrong_password" }

        # Expectations...
      end
    end
  end
end