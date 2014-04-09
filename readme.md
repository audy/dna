# DNA [![Build Status](https://secure.travis-ci.org/audy/dna.png?branch=master)](http://travis-ci.org/audy/dna) [![Coverage Status](https://coveralls.io/repos/audy/dna/badge.png)](https://coveralls.io/r/audy/dna)
A biological sequence file parser for Ruby

Austin G. Davis-Richardson

Features

  - Supported Formats ([submit a format request](https://github.com/audy/dna/issues/new?title=request%20for%20new%20format))
    - [fasta](http://en.wikipedia.org/wiki/FASTA)
    - [fastq](http://en.wikipedia.org/wiki/Fastq)
    - [qseq](http://blog.kokocinski.net/index.php/qseq-files-format?blog=2)
  - Autodetection of file formats so your scripts can be format agnostic
  - Automatic Gzip support
  - Files are read from disk (not stored in memory)

## Installation

Tested on Ruby 1.9.3 and 2.0.0

```
$ (sudo) gem install dna
```

## Usage

```ruby

require 'dna'

# Automatic Format Detection 

File.open('sequences.fasta') do |handle|
  records = Dna.new handle

  records.each do |record|
    puts record.length
  end
end

File.open('sequences.fastq') do |handle|
  records = Dna.new handle

  records.each do |record|
    puts record.quality
  end
end

File.open('sequences.qseq') do |handle|
  records = Dna.new handle
  puts records.first.inspect
end

# **caveat:** If you are reading from a compressed file
# or `stdin` you MUST specify the sequence format:

require 'zlib'

Zlib::GzipReader('sequences.fasta.gz') do |handle|
  records = Dna.new handle, :format => :fasta

  records.each do |record|
    puts record.length
  end
end
```

## Support for PHRED score parsing

```ruby

# Illumina > 1.3)

record.illumina_qualities # => [31, ..., 37]

# Error probabilities

record.illumina_probabilities
# => [1.0, 0.7943282347242815, ...,  0.3981071705534972]

# Solexa + Illumina =< 1.3

record.solexa_qualities
record.solexa_probabilities

# Sanger

record.sanger_qualities
record.sanger_probabilities

```

## Bonus Feature

The DNA gem is also a command-line tool with grep-like capabilities. Print records with (Ruby) regexp match in header.

```
$ dna spec/data/input.fastq "[1-2]"

@1
TGAAACTTATTGATCACCCCGCTTGGCGTTGGGGAGAAATTCAGAAAAGAGTGCTTGATGGGGCGCCACATGCCGTGCAACCCACTCTCTTTCACGCAGCGCGCCCCA
+1
5888.6778888650/-//&,(,./*-11'//0&,-0.(.,,,,/2/&-,,,,,.(.,(,..&---&-,,,((*-----*+.&,,,,,(//&,,,-(,,+(,,,--&(
@2
GTCGCGGCTTACCACCCAACGATTTTTTTTAGAGGTGCTGGTTTCA
+2
2550//*-1./4.--/'+.2.,,,,,,,,&(/00.11426554+13

$ dna spec/data/test.fasta "\d"

>1
GAGAGATCTCATGACACAGCCGAAG
>2
GAGACAUAUCCNNNAA

```

