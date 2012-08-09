# encoding: utf-8

require 'rubygems'
require 'bundler'

DNA_VERSION = '0.0.12'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "dna"
  gem.homepage = "http://audy.github.com/dna"
  gem.license = "MIT"
  gem.summary = "Simple FASTA/FASTQ/QSEQ parser library for Ruby"
  gem.description = "Simple FASTA/FASTQ/QSEQ parser library for Ruby."
  gem.email = "harekrishna@gmail.com"
  gem.authors = ["Austin G. Davis-Richardson"]
  gem.version = DNA_VERSION
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|

  version = DNA_VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "test #{version}"
  rdoc.rdoc_files.include('readme.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
