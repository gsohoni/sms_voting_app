namespace :import do
  desc "import data from log file to database"
  task :data => :environment do
    puts 'Importing data. Please wait.'
    
    # to store candidates and campaigns in a hash and avoid unnecessary db hits ..
    candidates = {}
    campaigns = {}
    
    File.open("#{RAILS_ROOT}/db/votes.txt").each do |line|
      begin
        # split the line and discard VOTE as it is not required ..
        attrs = line.split(" ")[1..4]
        voting_details = {}
        # Campaign:xxxxxx Choice:xxxxx Validity:xxxxx is stored in voting_details
        for option in attrs[1..3]
          key, value = option.split(':')
          voting_details[key] = value
        end
        # vote_identifier is the epoch time value
        vote_identifier = attrs[0]

        # create candidates and campaigns and store them in hash when not found
        unless candidates.keys.include? voting_details['Choice']
          candidate = Candidate.create!(:name => voting_details['Choice'])
          candidates[voting_details['Choice']] = candidate
        end

        unless campaigns.keys.include? voting_details['Campaign']
          campaign = Campaign.create!(:name => voting_details['Campaign'])
          campaigns[voting_details['Campaign']] = campaign
        end
        
        Vote.create!(:vote_identifier => vote_identifier, :candidate => candidates[voting_details['Choice']], :campaign => campaigns[voting_details['Campaign']], :validity => voting_details['Validity'])
        
      rescue Exception => e
        puts 'Error parsing log file entry. Continuing with rest of the file..'
        puts e
        next
      end
    end
    puts 'Data import is complete.'
  end
end