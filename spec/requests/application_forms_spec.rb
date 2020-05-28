require 'rails_helper'

RSpec.describe "/application_forms", type: :request do
  describe "GET #index" do
    it "renders a successful response" do
      get application_forms_url
      expect(response).to be_successful
    end

    it "assign @application_forms" do
      application_form = FactoryBot.create :application_form
      get application_forms_url
      expect(assigns(:application_forms)).to eq([application_form])
    end
  end

  describe "GET #new" do
    it "renders a successful response" do
      get new_application_form_url
      expect(response).to be_successful
    end

    it "assign to @application_form" do
      get new_application_form_url
      expect(assigns(:application_form)).to be_a_new(ApplicationForm)
    end
  end

  describe "POST /create" do
    invalid_params = {name: nil, email: nil, company: nil, message: nil}
    valid_params = {
      name: "James Dela Cruz",
      email: "james@gmail.com",
      company: "James Company",
      message: "Message details"
    }

    context "with valid parameters" do
      it "creates a new ApplicationForm" do
        expect {
          post application_forms_url, params: { application_form: valid_params }
        }.to change(ApplicationForm, :count).by(1)
      end

      it "redirects to the created application_form" do
        post application_forms_url, params: { application_form: valid_params }
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid parameters" do
      it "does not create a new ApplicationForm" do
        expect {
          post application_forms_url, params: { application_form: invalid_params }
        }.to change(ApplicationForm, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post application_forms_url, params: { application_form: invalid_params }
        expect(response).to be_successful
      end
    end
  end
end
