#
# Phred - intended to be used as a mixin to add phred-score
# conversions to integers with byte-offset taken into account
# and also for conversion from byte to probability.
#
# http://en.wikipedia.org/wiki/FASTQ_format
#
module Phred

  formats = {
    :illumina => { :offset => 33, :prob_func => Proc.new { |q| 10**(q/-10.0) } },
    :sanger => { :offset => 33, :prob_func => Proc.new { |q| 10**(q/-10.0) } },
    :solexa => { :offset => 64, :prob_func => Proc.new { |q| (10**(q/-10.0))/(1 + (10**(q/-10.0))) } },
  }

  #
  # use metaprogramming to create methods for converting
  # raw ascii quality string to quality socres and probabilities
  #
  # Do this without using method_missing so that the methods
  # are visable.
  #
  formats.each do |type, props|
    offset = props[:offset]
    prob_func = props[:prob_func]

    define_method "#{type}_scores" do
      qualities_with_offset(offset)
    end

    define_method "#{type}_probabilities" do
      probabilities_with_offset(offset, prob_func)
    end
  end

  extend self

  private

  def qualities_with_offset(offset)
    @quality.each_byte.map { |q| q - offset }
  end

  def probabilities_with_offset(offset, func)
    qualities_with_offset(offset).map do |q|
      func.call(q)
    end
  end

end
