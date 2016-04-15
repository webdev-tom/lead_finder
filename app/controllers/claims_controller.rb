class ClaimsController < ApplicationController
  def index
    @user = current_user
    @leads = Lead.where("user_id = ?", @user.id)
  end
end
