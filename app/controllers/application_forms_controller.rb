class ApplicationFormsController < ApplicationController

  def index
    @application_forms = ApplicationForm.all
  end

  def new
    @application_form = ApplicationForm.new
  end

  def create
    @application_form = ApplicationForm.new(application_form_params)

    if @application_form.save
      redirect_to root_path, notice: 'Application form was successfully created.'
    else
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def application_form_params
      params.require(:application_form).permit(:name, :email, :company, :message)
    end
end
