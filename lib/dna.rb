require 'zlib'

Dir.glob(File.join(File.dirname(__FILE__), 'dna', '*.rb')).each { |f| require f }
