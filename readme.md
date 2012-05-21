# DNA

A minimalistic sequence file parser.

Austin G. Davis-Richardson

Supported Formats:

  - [fasta](http://en.wikipedia.org/wiki/FASTA)
  - [fastq](http://en.wikipedia.org/wiki/Fastq)
  - [qseq](http://blog.kokocinski.net/index.php/qseq-files-format?blog=2)

[Request a format](https://github.com/audy/dna/issues/new)

## Installation

With Ruby 1.8.7 or better:

`gem install dna`

## CLI

DNA gem has grep-like capabilities. Print records with (Ruby) regexp match in header.

```
$ dna input.fastq "[1-2]"

@1
TGAAACTTATTGATCACCCCGCTTGGCGTTGGGGAGAAATTCAGAAAAGAGTGCTTGATGGGGCGCCACATGCCGTGCAACCCACTCTCTTTCACGCAGCGCGCCCCA
+1
5888.6778888650/-//&,(,./*-11'//0&,-0.(.,,,,/2/&-,,,,,.(.,(,..&---&-,,,((*-----*+.&,,,,,(//&,,,-(,,+(,,,--&(
@2
GTCGCGGCTTACCACCCAACGATTTTTTTTAGAGGTGCTGGTTTCA
+2
2550//*-1./4.--/'+.2.,,,,,,,,&(/00.11426554+13

$ cat input.fasta | dna "\d"

>1
GAGAGATCTCATGACACAGCCGAAG
>2
GAGACAUAUCCNNNAA

```


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
```