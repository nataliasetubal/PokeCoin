class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]

  def create
    user = User.login!(email: email, password: password)

    login(user)

    redirect_to wallets_path
  rescue ActiveRecord::RecordNotFound => e
    flash.now[:alert] = 'Usuário não encontrado'
    render :new, status: :unprocessable_entity
  end

  def destroy
    logout
    redirect_to root_path
  end

  def new; end

  private

  def email
    params.require(:user).require(:email)
  end

  def password
    params.require(:user).require(:password)
  end
end
