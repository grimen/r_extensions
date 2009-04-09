namespace :db do
  
  desc "Load seed fixtures (from db/fixtures) into the current environment's database." 
  task :populate => :environment do
    require 'active_record/fixtures'
    
    GLOBAL_FIXTURES_PATH = File.join(Rails.root, 'db', 'fixtures')
    
    Dir.glob(File.join(GLOBAL_FIXTURES_PATH, '**', '*.yml')).each do |file|
      puts "Loading fixture: #{File.basename(file)}\n"
      Fixtures.create_fixtures('db/fixtures', File.basename(file, '.*'))
    end
  end
  
end