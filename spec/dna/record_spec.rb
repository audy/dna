require 'spec_helper'

describe Fasta do
	
	let (:fasta) { Fasta.new name: 'test', sequence: 'GATC'}
	
	it 'can be created' do
		fasta.should_not be_nil
	end
	
	it 'has a name' do
		fasta.name.should_not be_nil
	end
	
	it 'has a sequence' do
		fasta.sequence.should_not be_nil
	end
	
	it 'has a length' do
	  fasta.length.should == fasta.sequence.length
  end
end

describe Fastq do
  let (:fastq) { Fastq.new name: 'test', sequence: 'GATC', quality: '....' }
  
  it 'can be created' do
    fastq.should_not be_nil
  end
  
  it 'has a name' do
    fastq.name.should_not be_nil
  end
  
  it 'has a sequence' do
    fastq.sequence.should_not be_nil
  end
  
  it 'has a quality score string' do
    fastq.quality.should_not be_nil
  end
  
  it 'has a length' do
    fastq.length.should == fastq.sequence.length
  end
end

describe QSEQ do
  let (:qseq) {
    line = 'HWUSI-EAS1690	0007	1	1	1139	20892	0	1	GTGTGCCAGCCGCCGCGGTAATACGTAGGTGGCAAGCGTTGTCCGGATTTATTGGGTGTAAAGGGCGCGTAGGCGGCCCTGTAAGTCAGTGGTGAAATCTC	fffffffffffffffeeeeedddddabdd\dddabeeeee^aabdcabddaKdddc`RcY`_c`aT`Ib]Tc^\cZEKOZ_\]\bZVK^UZG]`[^BBBBB	1'.split("\t")
    QSEQ.new(
      machine: line[0],
      run: line[1],
      lane: line[2],
      tile: line[3],
      x: line[4],
      y: line[5],
      index: line[6],
      read_no: line[7],
      sequence: line[8],
      quality: line[9],
      filtered: line[10],
  )}
  
  it 'can be created' do
    qseq.should_not be_nil
  end
  
  it 'has a header' do
    qseq.header.should_not be_nil
  end
  
  ['machine', 'run', 'lane', 'tile', 'x', 'y', 'index', 'read_no', 'sequence', 'quality', 'filtered'].each do |property|
    it "has a #{property}" do
      qseq.send(property).should_not be_nil
    end
  end
end