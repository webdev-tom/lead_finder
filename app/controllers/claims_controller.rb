class ClaimsController < ApplicationController
  def show
    @user = current_user
    @leads = Lead.where("user_id = ?", @user.id)
  end
end
