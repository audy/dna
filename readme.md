# DNA

Austin G. Davis-Richardson

Fasta file iterator. I created this gem because I was tired of copy-pasting dna.rb into my projects.

Coming soon: fastq, and qseq file formats.

## Installation

`gem install dna`

## Usage

```ruby

require 'dna'

File.open('sequences.fasta') do |handle|
  records = Dna.new(handle)
  
  records.each do |record|
    puts record.length
  end
end
```