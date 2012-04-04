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