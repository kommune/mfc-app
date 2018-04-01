class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  after_action :track_action

  protected

  def track_action
    ahoy.track "Page view", "#{controller_name}##{action_name}"
  end

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end

end
