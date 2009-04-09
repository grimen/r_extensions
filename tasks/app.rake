namespace :app do
  
  desc 'Setup app.'
  task :setup => :environment do |task, args|
    Rake::Task['db:create:all'].invoke
    Rake::Task['app:update'].invoke
    Rake::Task['app:reset'].invoke
  end
  
  desc 'Update dependencies.' 
  task :update => :environment do |task, args|
    `git pull origin master`
    `git submodule init`
    Rake::Task['gems:install'].invoke
    Rake::Task['jrails:update:javascripts'].invoke
  end
  
  desc 'Re-migrate and populate database.'
  task :reset => :environment do |task, args|
    Rake::Task['db:migrate:reset'].invoke
    Rake::Task['db:populate'].invoke
    Rake::Task['log:clear'].invoke
    Rake::Task['tmp:clear'].invoke
  end
  
end