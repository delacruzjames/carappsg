class ApplicationFormsController < ApplicationController

  def index
    @application_forms = ApplicationForm.all
  end

end
