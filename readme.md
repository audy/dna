# DNA

A minimalistic sequence file parser.

Austin G. Davis-Richardson

Supported Formats:

  - [fasta](http://en.wikipedia.org/wiki/FASTA)
  - [fastq](http://en.wikipedia.org/wiki/Fastq)
  - [qseq](http://blog.kokocinski.net/index.php/qseq-files-format?blog=2)

[Request a format](https://github.com/audy/dna/issues/new)

## Installation

With Ruby 1.9.2 or better:

`gem install dna`

## Usage

```ruby

require 'dna'

File.open('sequences.fasta') do |handle|
  records = Dna.new handle, format: 'fastq'
  
  records.each do |record|
    puts record.length
  end
end

File.open('sequences.fastq') do |handle|
  records = Dna.new handle, format: 'fastq'

  records.each do |record|
    puts record.quality
  end
end

File.open('sequences.qseq') do |handle|
  records = Dna.new handle, format: 'qseq'
  puts records.first.inspect
end
```