require 'rails_helper'

RSpec.describe Member, type: :model do
  it "should test that factory is valid" do
    expect(FactoryBot.build :member).to be_valid
  end

  it "should validate the presence of email" do
    member = FactoryBot.build :member, email: ''
    expect(member).not_to be_valid
    expect(member.errors.messages[:email]).to include("can't be blank")
  end

  it "should validate the incorrect email format" do
    invalid_email1 = FactoryBot.build :member, email: 'abc..def@mail.com'
    invalid_email2 = FactoryBot.build :member, email: '.abc@mail.com'
    invalid_email3 = FactoryBot.build :member, email: 'abc#def@mail.com'

    expect(invalid_email1).not_to be_valid
    expect(invalid_email2).not_to be_valid
    expect(invalid_email3).not_to be_valid

    expect(invalid_email1.errors.messages[:email]).to include("is invalid")
    expect(invalid_email2.errors.messages[:email]).to include("is invalid")
    expect(invalid_email3.errors.messages[:email]).to include("is invalid")
  end

  it "should validate correct email format" do
    valid_email = FactoryBot.build :member, email: 'james@mail.com'
    expect(valid_email).to be_valid
  end
end
