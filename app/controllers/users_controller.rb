class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      MailGibbon.new(params[:user][:email]).add_user
      flash["success"] = "Bienvenue ! Vous allez recevoir un email de confirmation."
    else
      flash["danger"] = "Vous n'avez pas été ajouté à notre newletter. Le mail ne doit pas être valide ou déjà pris."
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
