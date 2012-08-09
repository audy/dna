class QSEQParser

  def initialize(handle)
    @handle = handle
  end

  def each
    @handle.each do |line|
      line = line.strip.split("\t")
      record = QSEQ.new(
        :machine => line[0],
        :run => line[1],
        :lane => line[2],
        :tile => line[3],
        :x => line[4],
        :y => line[5],
        :index => line[6],
        :read_no => line[7],
        :sequence => line[8],
        :quality => line[9],
        :filtered => line[10]
      )
      yield record
    end
  end
end

##
# QSEQ record
#
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