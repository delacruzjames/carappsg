require 'rails_helper'

RSpec.describe PagesController, type: :routing do
  describe "routing" do
    it { expect(:get => "/").to route_to("pages#index") }
  end
end
