require 'spec_helper'

describe Dna do
  include_context "parser stuff"

  let(:fasta) { Dna.new(@fasta_file) }
  let(:fastq) { Dna.new @fastq_file }
  let(:qseq) { Dna.new @qseq_file }
  let(:empty) { Dna.new @empty_file }

  it 'doesnt freak out on empty files' do
    fasta.format == :empty
  end

  it 'can auto-detect fasta format' do
    fasta.format.should == :fasta
  end

  it 'can auto-detect fastq format' do
    fastq.format.should == :fastq
  end

  it 'can auto-detect qseq format' do
    qseq.format.should == :qseq
  end

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