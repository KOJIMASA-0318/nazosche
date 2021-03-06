class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

   # ログイン済ユーザーのみにアクセスを許可する
   #before_action :authenticate_user!

   # deviseコントローラーにストロングパラメータを追加する
   before_action :configure_permitted_parameters, if: :devise_controller?

   protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  #ログイン後のリダイレクト先設定
  def after_sign_in_path_for(resource)
      user_path(resource.id)
  end

end
