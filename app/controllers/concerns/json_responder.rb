module ExceptionHandler
  extend ActiveSupport::Concern
  private
  def json_response(model, instance_variable, action)
    if instance_variable.save
      response = { message: "#{model} #{action}d successfully.", data: instance_variable }
      render json: response, status: "#{action}d"
    else
      render json: instance_variable.errors, status: :bad
    end
  end
end