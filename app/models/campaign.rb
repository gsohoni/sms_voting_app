class Campaign < ActiveRecord::Base
  
  validates :name, :presence => true
  
  has_many  :candidates, :through => :votes, :uniq => true
  has_many  :votes
  
  def valid_votes
    self.votes.where(:validity => 'during')
  end
  
  def invalid_votes
    self.votes - self.valid_votes
  end
end
