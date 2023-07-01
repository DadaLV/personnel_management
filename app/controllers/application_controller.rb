class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_language
    selected_language = params[:language].to_sym
    session[:locale] = selected_language
    redirect_back(fallback_location: request.referer)
  end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
