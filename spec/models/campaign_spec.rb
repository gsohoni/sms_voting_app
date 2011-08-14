require 'spec_helper'

describe Campaign do
  fixtures :votes, :campaigns, :candidates
  #include CampaignSpecHelper
  
  before(:each) do
    @campaign = Campaign.new
  end
  
  it 'is not a valid Campaign without a name' do
    @campaign.should_not be_valid
  end
  
  it 'is a valid Campaign with a name' do
    @campaign.name = 'Campaign One'
    @campaign.should be_valid
  end
  
  it 'has valid votes for validity = during' do
    @campaign_one = campaigns(:campaign_one)
    @campaign_one.valid_votes.count.should == 2
  end
  
  it 'has invalid_votes where validity !=  during' do
    @campaign_one = campaigns(:campaign_one)
    @campaign_one.invalid_votes.count.should == 2
  end
  
  it 'has total votes = valid + invalid' do
    @campaign_one = campaigns(:campaign_one)
    @campaign_one.votes.count == (@campaign_one.valid_votes.count + @campaign_one.invalid_votes.count) 
  end
  
  it 'has many votes' do
    @campaign.should respond_to(:votes)
  end
  
end
