require 'spec_helper'

# XXX should probably use the actual record objects
class TestRecord
  include Phred
  attr_accessor :quality
end

##
# Definition of different FASTQ formats for Phred scores
# as defined in the wikipedia article for the FASTQ format.
#
# Each format definition needs a :string, a :scores and a :probabilities
# Conversion between these properties is automatically tested by the
# test suite.
#
## Solexa and Illumina <= 1.3 (we just call it Solexa here)
#
# - 0-93 with ascii offset 33
# - Probability of error:
#     `Q = -10log10(P/1-P)`
#     Solve for P yourself :P
#
## Sanger
#
# - 0-62 with ascii ofset 64
# - Probability of error given by p = 10**(Q/10)
# - Quality = -10log10(P)
#
## Illumina 1.3+
#
# Illumina-formatted quality scores are the same as sanger except:
# - 0 and 1 are not used
# - 2 is reserved for B which just means 'really bad, do not use'
#
## 454
#
# - No one uses 454.
#
#
format_definitions = {
  :solexa => {
    :string => (0..62).map { |q| (q + 64).chr }.join,
    :scores => (0..62).to_a,
    :probabilities => (0..62).map { |q| (10**((q)/-10.0))/(1 + 10**(q/-10.0)) }
  },

  :illumina => {
    :string => (3..93).map { |q| (q + 33).chr }.join + 'B'*4,
    :scores => (3..93).to_a + [33, 33, 33, 33],
    :probabilities => ((3..93).to_a + [33, 33, 33, 33]).map { |q| 10**((q)/-10.0) }
  },

  :sanger => {
    :string => (0..93).map { |q| (q + 33).chr }.join,
    :scores => (0..93).to_a,
    :probabilities => (0..93).map { |q| 10**((q)/-10.0) }
  }
}

describe Phred do

  let (:test_record) { TestRecord.new }

  format_definitions.each_pair do |type, properties|

    it "should properly convert #{type} raw ascii PHRED scores to integers" do
      test_record.quality = properties[:string]
      test_record.send(:"#{type}_scores").should == properties[:scores]
    end

    it "should properly convert #{type.to_s} raw ascii PHRED scores to probabilities" do
      test_record.quality = properties[:string]
      test_record.send(:"#{type}_probabilities").should == properties[:probabilities]
    end
  end

end
