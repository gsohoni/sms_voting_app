namespace :import do
  desc "import data from log file to database"
  task :data => :environment do
    puts 'Importing data. Please wait.'
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
        candidate = Candidate.find_or_create_by_name(voting_details['Choice'])
        campaign = Campaign.find_or_create_by_name(voting_details['Campaign'])
        Vote.create!(:vote_identifier => vote_identifier, :candidate => candidate, :campaign => campaign, :validity => voting_details['Validity'])
        print '.'
      rescue
        puts 'Error parsing log file entry. Continuing with rest of the file..'
        next
      end
    end
    puts 'Data import is complete.'
  end
end