class Leads::OwnsController < ApplicationController
  before_action :load_lead

  def update
    @lead.favorite!
  end

  def destroy
    @lead.unfavorite!
  end

  protected

  def load_lead
    @lead = Lead.find(params[:id])
  end
end
