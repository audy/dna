class Record # nucleotide record
  include Phred

  def length
    @sequence.length
  end
end
# load parsers after Record because they inherit from Record
Dir.glob(File.join(File.dirname(__FILE__), 'parsers', '*.rb')).each { |f| require f }
