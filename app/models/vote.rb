class Vote < ActiveRecord::Base
  
  validates   :campaign, :candidate, :presence => true
  belongs_to  :campaign
  belongs_to  :candidate
end
