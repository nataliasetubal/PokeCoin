class WalletsController < AuthenticatedController
  def index
    @wallet = Wallet.find_by!(user_id: current_user.id)
  rescue ActiveRecord::RecordNotFound
    flash.now[:alert] = 'Carteira não encontrada'
    render :new, status: :unprocessable_entity
  end
end
