# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # def create
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   puts '*******************************************'
  #   super do |resource|
  #     puts "----------------------------------------------------"
      
  #     puts resource
  #     puts "----------------------------------------------------"
  #     unless resource.is_active
  #       sign_out
  #       redirect_to root_path, alert: "Desculpe, mas sua conta não está mais ativa."
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
