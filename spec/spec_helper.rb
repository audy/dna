$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'rspec'
require 'dna'

path = File.dirname(__FILE__)
fasta_file = File.readlines(File.join(path, 'data/test.fasta'))
fastq_file = File.readlines(File.join(path, 'data/test.fastq'))
qseq_file = File.readlines(File.join(path, 'data/test.qseq'))

shared_context "parser stuff" do
  before do
    @fasta_file = fasta_file
    @fastq_file = fastq_file
    @qseq_file = qseq_file
  end
end