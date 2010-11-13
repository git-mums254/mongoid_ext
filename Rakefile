require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "mongoid_ext"
    gem.summary = %Q{mongoid plugins}
    gem.description = %Q{mongoid plugins}
    gem.email = "krawek@gmail.com"
    gem.homepage = "http://github.com/dcu/mongoid_ext"
    gem.authors = ["David A. Cuadrado"]
    gem.add_development_dependency "shoulda", "~> 2.11.3"
    gem.add_development_dependency "jnunemaker-matchy", "~> 0.4"
    gem.add_development_dependency 'shoulda', '~> 2.11.3'
    gem.add_development_dependency 'mocha', '~> 0.9.4'
    gem.add_development_dependency 'timecop'

    gem.add_dependency 'mongoid', '~> 2.0.0.beta.20'
    gem.add_dependency 'uuidtools', '>= 2.1.1'
    gem.add_dependency 'i18n', '~> 0.4.1'
    gem.add_dependency 'tzinfo', '~> 0.3'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mongoid_ext #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
