class ApplicationFormsController < ApplicationController

  def index
    @application_forms = ApplicationForm.all
  end

  def new
    @application_form = ApplicationForm.new
  end
end
