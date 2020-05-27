json.extract! application_form, :id, :name, :email, :company, :message, :created_at, :updated_at
json.url application_form_url(application_form, format: :json)
