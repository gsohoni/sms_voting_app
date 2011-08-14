require 'spec_helper'

describe CampaignsController, 'GET index' do
    
    before do
      @campaign = mock_model(Campaign)
      Campaign.stub!(:find).and_return(@campaign)
    end
    
    def do_get
      get :index
    end
    
    it 'should be successful' do
      do_get
      response.should be_success
    end
    
    it 'should render index template' do
      do_get
      response.should render_template('index')
    end
    
    it 'should find all campaigns' do
      Campaign.should_receive(:all).and_return([@campaign])
      do_get
    end
    
    it 'should assign found campaigns for the view' do
      @campaigns = [mock_model(Campaign), @campaign]
      Campaign.should_receive(:all).and_return(@campaigns)
      do_get
      assigns[:campaigns].should == @campaigns
    end
    
end
  
describe CampaignsController, 'show method - campaigns/1' do
    
    before do
      @campaign = mock_model(Campaign)
      Campaign.stub!(:find).and_return(@campaign)
    end
    
    def do_get
      get :show, :id => 1
    end
    
    it 'should be successful' do
      do_get
      response.should be_success
    end
    
    it 'should render show template' do
      do_get
      response.should render_template('show')
    end
    
    it 'should find requested campaign' do
      Campaign.should_receive(:find).with(1).and_return(@campaign)
      do_get
    end
    
    it 'should assign the found campaign to view' do
      do_get
      assigns[:campaign].should == @campaign
    end

end