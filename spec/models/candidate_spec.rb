require 'spec_helper'

describe Candidate do
  
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
end
