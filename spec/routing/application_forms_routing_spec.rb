require "rails_helper"

RSpec.describe ApplicationFormsController, type: :routing do
  describe "routing" do
    it { expect(get: "/application_forms").to route_to("application_forms#index") }
    it { expect(get: "/application_forms/new").to route_to("application_forms#new") }
    it { expect(post: "/application_forms").to route_to("application_forms#create") }
  end
end
