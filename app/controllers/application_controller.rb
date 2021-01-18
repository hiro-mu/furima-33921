class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :kanji_name, :kanji_lastname, :kana_name, :kana_lastname, :birthday])
  end
end
