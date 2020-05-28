require 'rails_helper'

RSpec.describe "/application_forms", type: :request do
  # ApplicationForm. As you add validations to ApplicationForm, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

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

  describe "GET /new" do
    it "renders a successful response" do
      get new_application_form_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ApplicationForm" do
        expect {
          post application_forms_url, params: { application_form: valid_attributes }
        }.to change(ApplicationForm, :count).by(1)
      end

      it "redirects to the created application_form" do
        post application_forms_url, params: { application_form: valid_attributes }
        expect(response).to redirect_to(application_form_url(ApplicationForm.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ApplicationForm" do
        expect {
          post application_forms_url, params: { application_form: invalid_attributes }
        }.to change(ApplicationForm, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post application_forms_url, params: { application_form: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
