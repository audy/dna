require 'spec_helper'

describe Dna do
  include_context "parser stuff"
  
  let(:fasta) { @fasta_file }
  let (:fastq) { @fastq_file }
  let (:qseq) { @qseq_file }
  
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