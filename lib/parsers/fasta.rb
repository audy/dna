class FastaParser
  
  def initialize(handle)
    @handle = handle
  end

  def each
    sequence, header = nil, nil
    @handle.each do |line|
      if line[0].chr == '>'
        yield Fasta.new(:name => header, :sequence => sequence) if sequence
        sequence = ''
        header = line[1..-1].strip
      else
        sequence << line.strip.tr(' ','')
      end
    end
    yield Fasta.new(:name => header, :sequence => sequence)
  end
end