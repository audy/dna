class Dna # iterator
  include Enumerable
  
  def initialize(handle, args={})
    @handle = handle
    @format = args[:type].to_sym
    
    @iterator = 
      case @format
      when :fasta
        fasta_parser
      when :fastq
        fastq_parser
      when :qseq
        qseq_parser
      else
        raise "#{@type} not supported."
      end
  end
  
  def each &block
    @iterator.each do |r|
      if block_given?
        block.call r
      else
        yield r
      end
    end
  end
  
  private
  
  def fasta_parser
    sequence, header = nil, nil
    Enumerator.new do |enum|
      @handle.each do |line|
        if line[0].chr == '>'
          enum.yield Fasta.new(:name => header, :sequence => sequence) if sequence
          sequence = ''
          header = line[1..-1].strip
        else
          sequence << line.strip.tr(' ','')
        end
      end
      enum.yield Fasta.new(:name => header, :sequence => sequence)
    end
  end
  
  def fastq_parser
  end
  
  def qseq_parser
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
      ">#{@name}\n#{@sequence}\n"
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
#

class QSEQ < Record
  attr_accessor :machine, :run, :lane, :tile, :x, :y, :index, :read_no, :sequence, :quality, :filtered
  
  def initialize(args={})
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
    [@machine, @run, @lane, @tile, @x, @y, @index, @read_no, @sequence, @quality, @filtered].join("\t")
  end
  
  def header
    [@machine, @run, @lane, @tile, @x, @y, @index, @read_no, @sequence, @quality, @filtered].join(':')
  end
end