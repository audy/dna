require 'spec_helper'

describe Dna do
  include_context "parser stuff"

  let(:fasta) { Dna.new @fasta_file, format: 'fasta' }
  let (:fastq) { Dna.new @fastq_file, format: 'fastq' }
  let (:qseq) { Dna.new @qseq_file, format: 'qseq' }

  it 'can parse a crappily formatted fasta file' do
    fasta.to_a.length.should == 2
  end

  it 'generates fasta objects from a fasta file' do
    fasta.first.class.should == Fasta
  end

  it 'can parse fastq format' do
    fastq.to_a.length.should == 2
  end

  it 'generates fastq objects from a fasta file' do
    fastq.first.class.should == Fastq
  end

  it 'can parse qseq' do
    qseq.to_a.length.should == 2
  end

  it 'generates qseq objects from a qseq file' do
    qseq.first.class.should == QSEQ
  end
end