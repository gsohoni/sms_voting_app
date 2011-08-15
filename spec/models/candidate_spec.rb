require 'spec_helper'

describe Candidate do
  
  fixtures :campaigns, :candidates, :votes
  before(:each) do
    @candidate = Candidate.new
  end
  
  it 'is not valid without a name' do
    @candidate.should_not be_valid
  end
  
  it 'is valid when supplied with a name' do
    @candidate.name = 'XYZ'
    @candidate.should be_valid
  end
  
  it 'belongs to campaign' do
    @candidate.should respond_to(:campaign)
  end
  
  it 'has campaign score = valid vote count' do
    @candidate = candidates(:candidate_one)
    @candidate.campaign_score(campaigns(:campaign_one)).should == 2
  end
end
