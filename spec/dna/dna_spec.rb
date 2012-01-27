require 'spec_helper'

describe Dna do
	
	let(:fasta) {
		(">testtest\nGATCAGAGATCAT\ngacctatcaca\nGAGAGATANANANAGACTATA\n" + \
		"\n\n>testtesttest\nGAGAGACACGAG\n\nGAGAGCACANANANAN\n").split
	}
	
	let (:fastq) {
	  f=<<-EOF
@1UOLP:4:17
TGAAACTTATTGATCACCCCGCTTGGCGTTGGGGAGAAATTCAGAAAAGAGTGCTTGATGGGGCGCCACATGCCGTGCAACCCACTCTCTTTCACGCAGCGCGCCCCA
+
5888.6778888650/-//&,(,./*-11'//0&,-0.(.,,,,/2/&-,,,,,.(.,(,..&---&-,,,((*-----*+.&,,,,,(//&,,,-(,,+(,,,--&(
@1UOLP:4:32
GTCGCGGCTTACCACCCAACGATTTTTTTTAGAGGTGCTGGTTTCA
+
2550//*-1./4.--/'+.2.,,,,,,,,&(/00.11426554+13
	  EOF
	  f.split
	}
	
	let (:qseq) {
	  
	}
	
	it 'can parse a crappily formatted fasta file' do
		records = Dna.new fasta, type: 'fasta'
    records.to_a.length.should == 2
	end
	
	it 'can parse fastq format' do
	  records = Dna.new fastq, type: 'fastq'
    records.to_a.length.should == 2
  end
end