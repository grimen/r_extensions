require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

GEM = "r_extensions"
SUMMARY = %Q{Ruby + Rails extensions...that I tend to en up writing all the time.}
HOMEPAGE = "http://github.com/grimen/#{GEM}/tree/master"
AUTHOR = "Jonas Grimfelt"
EMAIL = "grimen@gmail.com"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = GEM
    s.summary = SUMMARY
    s.description = SUMMARY
    s.homepage = HOMEPAGE
    s.author = AUTHOR
    s.email = EMAIL
    
    s.require_paths = %w{lib}
    s.files = %w(MIT-LICENSE README.textile Rakefile) + Dir.glob(File.join('{rails,bin,lib,test}', '**', '*'))
    s.executables = %w()
    s.extra_rdoc_files = %w{README.textile}
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc %Q{Run unit tests for "#{GEM}".}
task :default => :test

desc %Q{Run unit tests for "#{GEM}".}
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc %Q{Generate documentation for "#{GEM}".}
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = GEM
  rdoc.options << '--line-numbers' << '--inline-source' << '--charset=UTF-8'
  rdoc.rdoc_files.include('README.textile')
  rdoc.rdoc_files.include(File.join('lib', '**', '*.rb'))
end
