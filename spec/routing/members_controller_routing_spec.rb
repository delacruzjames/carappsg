require 'rails_helper'

RSpec.describe MembersController, type: :routing do
  describe "routing" do
    it { expect(:get => "/members").to route_to("members#index") }
  end
end
