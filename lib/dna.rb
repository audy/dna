require 'zlib'

[ 'version.rb', 'dna.rb', 'phred.rb', 'record.rb'].each do |f|
  fp = File.join(File.dirname(__FILE__), 'dna', f)
  require fp
end
