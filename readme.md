# DNA

Austin G. Davis-Richardson

Sequence file iterator

  - fasta
  - fastq
  - qseq

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