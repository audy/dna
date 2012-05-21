Gem::Specification.new do |s|
	s.name    = 'dna'
	s.version = '0.0.11'
	s.date    = '2012-05-21'

	s.summary     = 'DNA sequence parser'
	s.description = 'for parsing various types of DNA sequence files'

	s.authors = ["Austin G. Davis-Richardson"]
	s.email   = "harekrishna@gmail.com"

	s.rubyforge_project = 'dna'

	s.files         = `git ls-files`.split("\n")
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

	s.homepage = "http://github.com/audy/dna"
end
