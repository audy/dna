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
  let (:string) { "HWUSI-EAS1690\t0007\t1\t1\t1139\t20892\t0\t1\tGTGTGCCAGCCGCCGCGGTAATACGTAGGTGGCAAGCGTTGTCCGGATTTATTGGGTGTAAAGGGCGCGTAGGCGGCCCTGTAAGTCAGTGGTGAAATCTC\tfffffffffffffffeeeeedddddabdd\dddabeeeee^aabdcabddaKdddc`RcY`_c`aT`Ib]Tc^\cZEKOZ_\]\bZVK^UZG]`[^BBBBB\t1" }

  let (:properties) {
    line = string.split("\t")
    { machine: line[0],
      run: line[1],
      lane: line[2],
      tile: line[3],
      x: line[4],
      y: line[5],
      index: line[6],
      read_no: line[7],
      sequence: line[8],
      quality: line[9],
      filtered: line[10] }
  }

  let (:qseq) {
    QSEQ.new(properties)}

  it 'can be created' do
    qseq.should_not be_nil
  end

  it 'has a header' do
    qseq.header.should_not be_nil
  end

  ['machine', 'run', 'lane', 'tile', 'x', 'y', 'index', 'read_no', 'sequence', 'quality', 'filtered'].each do |property|
    it "has property #{property}" do
      qseq.send(property).should == properties[property.to_sym]
    end
  end

  it 'can be printed back in its original form' do
    qseq.to_s.should == string
  end
end