# DNA

A biological sequence file parser for Ruby

Austin G. Davis-Richardson

Features

  - Supported Formats ([request another](https://github.com/audy/dna/issues/new?title=request%20for%20new%20format))
    - [fasta](http://en.wikipedia.org/wiki/FASTA)
    - [fastq](http://en.wikipedia.org/wiki/Fastq)
    - [qseq](http://blog.kokocinski.net/index.php/qseq-files-format?blog=2)
  - Autodetection of file formats so your scripts can be format agnostic

## Installation

With Ruby 1.8.7 or better:

`(sudo) gem install dna`



## Usage

```ruby

require 'dna'

# format detected automatically by inspecting the contents of the file.

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

# Even supports Gzip 
File.open('sequences.fasta.gz') do |handle|
  records = Dna.new handle

  records.each do |record|
    puts record.length
  end
end
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

