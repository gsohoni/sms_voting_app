require 'spec_helper'

describe Vote do
  
  before(:each) do 
    @vote = Vote.new
    @candidate  = Candidate.new(:name => 'XYZ')
    @campaign = Campaign.new(:name => 'New Campaign')
  end
  
  it 'is not valid without a candidate and a campaign' do
    @vote.should_not be_valid
  end
  
  it 'is not valid without a candidate even when it has a campaign' do
    @vote.candidate = @candidate
    @vote.should_not  be_valid
  end
  
  it 'is not valid without a campaign even when it has a candidate' do
    @vote.campaign = @campaign
    @vote.should_not  be_valid
  end
  
  it 'is valid when both candidate and campaign are present' do
    @vote.candidate = @candidate
    @vote.campaign = @campaign
    @vote.should  be_valid
  end
end
