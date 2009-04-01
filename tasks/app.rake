namespace :app do
  
  desc 'Initialize app.' 
  task :setup => :environment do |task, args|
    Rake::Task['db:create:all'].invoke
    Rake::Task['gems:install'].invoke
    Rake::Task['app:reset'].invoke
  end
    
  desc 'Re-migrate and populate database.' 
  task :reset => :environment do |task, args|
    Rake::Task['db:migrate:reset'].invoke
    Rake::Task['db:populate'].invoke
    Rake::Task['log:clear'].invoke
    Rake::Task['tmp:clear'].invoke
    Rake::Task['partial_dependencies:generate_picture'].invoke
  end
  
end