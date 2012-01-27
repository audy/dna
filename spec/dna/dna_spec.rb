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
	  f=<<-EOF
HWUSI-EAS1690	0007	1	1	1139	20892	0	1	GTGTGCCAGCCGCCGCGGTAATACGTAGGTGGCAAGCGTTGTCCGGATTTATTGGGTGTAAAGGGCGCGTAGGCGGCCCTGTAAGTCAGTGGTGAAATCTC	fffffffffffffffeeeeedddddabdd\dddabeeeee^aabdcabddaKdddc`RcY`_c`aT`Ib]Tc^\cZEKOZ_\]\bZVK^UZG]`[^BBBBB	1
HWUSI-EAS1690	0007	1	1	1174	18551	0	1	GTGTGCCAGCAGCCGCGGTAATACAGAGGGGGCAAGCGTTGTTCGGAATTACTGGGCGTAAAGGGCGCGTAGGCGGCCCGCTAAGCCGAACGTGAAATCCC	ffffffffffcffffffeffddddYdb^ddbJ]Y^eeede^eadeedLeed\ddddIdddd`ddd^edcTacaa`aJ^aLZ^]Y^BBBBBBBBBBBBBBBB	1
  EOF
  f.split("\n")
	}
	
	it 'can parse a crappily formatted fasta file' do
		records = Dna.new fasta, type: 'fasta'
    records.to_a.length.should == 2
	end
	
	it 'can parse fastq format' do
	  records = Dna.new fastq, type: 'fastq'
    records.to_a.length.should == 2
  end
  
  it 'can parse qseq' do
    records = Dna.new qseq, type: 'qseq'
    records.to_a.length.should == 2
  end
end