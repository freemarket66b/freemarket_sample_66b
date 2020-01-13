class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name, :first_name, :fiest_name_kana, :last_name, :last_name_kana, :phone_number, :birthday_year, :birthday_month, :birthday_day, :prefecture, :city, :address, :postal_code, :building_name])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
#:nickname, :name, :first_name, :fiest_name_kana, :last_name, :last_name_kana, :phone_number, :birthday_year, :birthday_month, :birthday_day, :passwaord, :mail, :phone_number, :prefecture, :city, :address, :postal_code, :building_name, :exhibit_product, :exhibit_number, :exhibit_now, :exhibit_trading, :exhibit_sold, :points, :like,:earning, :purchase_history_id, :sales_history_id