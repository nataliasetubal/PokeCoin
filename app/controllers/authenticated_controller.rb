class AuthenticatedController < ApplicationController
  before_action :authenticate_user

  def authenticate_user
    return if user_signed_in?

    redirect_to root_path, notice: 'Você precisa estar logado para acessar esse recurso.'
  end
end
