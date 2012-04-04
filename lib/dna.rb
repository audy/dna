Dir.glob(File.join(File.dirname(__FILE__), 'parsers', '*.rb')).each { |f| require f }

##
# Dna
#
class Dna
  include Enumerable

  attr_reader :format

  def initialize(handle)
    @handle = handle
    @format = detect_format
    @iterator =
      case @format
      when :fasta
        FastaParser.new @handle
      when :fastq
        FastqParser.new @handle
      when :qseq
        QSEQParser.new @handle
      else
        raise "#{@format} not supported."
      end
  end

  def detect_format
    first_line = @handle.first
    @handle.rewind if @handle.class == File

    # detect qseq by counting number of tabs.
    if first_line.split("\t").length == 11
      return :qseq
    elsif first_line[0].chr == '>'
      return :fasta
    elsif first_line[0].chr == '@'
      return :fastq
    else
      raise Exception, "cannot detect format of input"
    end
  end

  def each &block
    @iterator.each(&block)
  end
end

class Record # nucleotide record
  def length
    @sequence.length
  end
end

##
# Fasta record
#
class Fasta < Record
  attr_accessor :name, :sequence

  def initialize(args={})
    @name = args[:name]
    @sequence = args[:sequence]
  end

  def to_s
    ">#{@name}\n#{@sequence}"
  end
end

##
# Fastq record
#
class Fastq < Record
  attr_accessor :name, :sequence, :format, :quality

  def initialize(args={})
    @name = args[:name]
    @sequence = args[:sequence]
    @quality = args[:quality]
  end

  def to_s
    "@#{@name}\n#{@sequence}\n+#{@name}\n#{@quality}"
  end
end

##
# QSEQ record
#2
class QSEQ < Record

  attr_accessor :machine, :run, :lane, :tile, :x, :y, :index, :read_no, :sequence, :quality, :filtered

  def initialize(args={})
    # These are the properties defined by the qseq spec
    # they must be in the same order that they appear in the tab-separated qseq file
    @properties = :machine, :run, :lane, :tile, :x, :y, :index, :read_no, :sequence, :quality, :filtered
    @machine = args[:machine]
    @run = args[:run]
    @lane = args[:lane]
    @tile = args[:tile]
    @x = args[:x]
    @y = args[:y]
    @index = args[:index]
    @read_no = args[:read_no]
    @sequence = args[:sequence]
    @quality = args[:quality]
    @filtered = args[:filtered]
  end

  def to_s
    @properties.collect { |x| self.send(x) }.join("\t")
  end

  def header
    @properties.collect { |x| self.send(x) }.join("\t")
  end
end