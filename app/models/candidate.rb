class Candidate < ActiveRecord::Base
  
  validates :name, :presence => true
  
  belongs_to  :campaign
  
  def campaign_score(campaign)
    campaign.valid_votes.where(:candidate_id => self)
  end
end
