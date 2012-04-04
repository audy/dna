class FastqParser

  def initialize(handle)
    @handle = handle
  end
  
  def each
    c = (0..3).cycle
    params = { :name => nil, :sequence => nil, :quality => nil }
    @handle.each do |line|
      n = c.next
      case n
      when 0
        params[:name] = line.strip[1..-1]
      when 1
        params[:sequence] = line.strip
      when 2
        nil
      when 3
        params[:quality] = line.strip
        record = Fastq.new params
        yield record
      end
    end
  end
end