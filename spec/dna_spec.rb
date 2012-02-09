require 'spec_helper'

describe Dna do
  include_context "parser stuff"

  let(:fasta) { Dna.new @fasta_file, :format => 'fasta' }
  let (:fastq) { Dna.new @fastq_file, :format => 'fastq' }
  let (:qseq) { Dna.new @qseq_file, :format => 'qseq' }

  it 'can properly parse a crappily formatted fasta file' do
    records = fasta.to_a
    records[1].name.should == '2'
  end

  it 'generates fasta objects from a fasta file' do
    fasta.first.class.should == Fasta
  end

  it 'can properly parse fastq format' do
    records = fastq.to_a
    records[1].name.should == '2'
  end

  it 'generates fastq objects from a fasta file' do
    fastq.first.class.should == Fastq
  end

  it 'generates fastq objects from a fasta file' do
    fastq.first.sequence.should_not be_nil
  end

  it 'can properly parse qseq format' do
    records = qseq.to_a
    records[1].sequence.should == 'GTGTGCCAGCAGCCGCGGTAATACAGAGGGGGCAAGCGTTGTTCGGAATTACTGGGCGTAAAGGGCGCGTAGGCGGCCCGCTAAGCCGAACGTGAAATCCC'
  end

  it 'generates qseq objects from a qseq file' do
    qseq.first.class.should == QSEQ
  end
end