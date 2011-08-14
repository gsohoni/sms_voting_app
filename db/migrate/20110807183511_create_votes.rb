class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer     :vote_identifier
      t.belongs_to  :campaign
      t.belongs_to  :candidate
      t.string      :validity
      t.timestamps
    end
    
    add_index :votes, :campaign_id
    add_index :votes, :candidate_id
  end

  def self.down
    drop_table :votes
  end
end
