require 'spec_helper'

describe Dna do
	
	let(:fasta) {
		(">testtest\nGATCAGAGATCAT\ngacctatcaca\nGAGAGATANANANAGACTATA\n" + \
		"\n\n>testtesttest\nGAGAGACACGAG\n\nGAGAGCACANANANAN\n").split
	}
	
	it 'can parse a crappily formatted fasta file' do
		records = Dna.new fasta, type: 'fasta'
    records.to_a.length.should == 2
	end
end