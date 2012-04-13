Gem::Specification.new do |s|
	s.name = 'dna'
	s.version = '0.0.8'
	s.date = '2012-04-05'
	s.summary = 'DNA sequence parser'
	s.description = 'for parsing various types of DNA sequence files'
	s.authors = ["Austin G. Davis-Richardson"]
	s.email = "harekrishna@gmail.com"
	s.files = Dir['lib/*.rb'] + Dir['lib/parsers/*rb'] + Dir['spec/*'] + Dir['spec/data/*'] + ['readme.md']
	s.homepage = "http://github.com/audy/dna"
end
