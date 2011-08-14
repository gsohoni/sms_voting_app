class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
    
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @campaigns }
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
    
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @campaign }
    end
  end

end
