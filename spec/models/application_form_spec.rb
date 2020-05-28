require 'rails_helper'

RSpec.describe ApplicationForm, type: :model do
  it "should test the factory is valid" do
    expect(FactoryBot.build :application_form).to be_valid
  end

  describe "fields#name" do
    it "should validate the presence of name" do
      application_form = FactoryBot.build :application_form, name: ''

      expect(application_form).not_to be_valid
      expect(application_form.errors.messages[:name]).to include("can't be blank")
    end

    it "should validate uniqueness of name" do
      application_form = FactoryBot.create :application_form, name: 'James Dela Cruz'
      expect(application_form).to be_valid

      new_application_form = FactoryBot.build :application_form, name: 'James Dela Cruz'
      expect(new_application_form).not_to be_valid
      expect(new_application_form.errors.messages[:name]).to include("has already been taken")
    end
  end

  describe "fields#company" do
    it "should validate the presence of company" do
      application_form = FactoryBot.build :application_form, company: ''

      expect(application_form).not_to be_valid
      expect(application_form.errors.messages[:company]).to include("can't be blank")
    end
  end

  describe "fields#company" do
    it "should validate the presence of message" do
      application_form = FactoryBot.build :application_form, message: ''

      expect(application_form).not_to be_valid
      expect(application_form.errors.messages[:message]).to include("can't be blank")
    end
  end

  describe "fields#email" do
    it "should validate the presence of email" do
      application_form = FactoryBot.build :application_form, email: ''

      expect(application_form).not_to be_valid
      expect(application_form.errors.messages[:email]).to include("can't be blank")
    end

    it "should validate the incorrect email format" do
      invalid_email1 = FactoryBot.build :application_form, email: 'abc..def@mail.com'
      invalid_email2 = FactoryBot.build :application_form, email: '.abc@mail.com'
      invalid_email3 = FactoryBot.build :application_form, email: 'abc#def@mail.com'

      expect(invalid_email1).not_to be_valid
      expect(invalid_email2).not_to be_valid
      expect(invalid_email3).not_to be_valid

      expect(invalid_email1.errors.messages[:email]).to include("is invalid")
      expect(invalid_email2.errors.messages[:email]).to include("is invalid")
      expect(invalid_email3.errors.messages[:email]).to include("is invalid")
    end
  end
end
