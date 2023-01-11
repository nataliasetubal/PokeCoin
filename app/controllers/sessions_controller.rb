class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: %i[create new]

  def create
    user = User.login!(email: email, password: password)

    current_user_id(user)

    redirect_to agenda_index_path
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

  def username
    params.require(:user).require(:username)
  end

  def password
    params.require(:user).require(:password)
  end
end
