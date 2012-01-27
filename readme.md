# DNA

Austin G. Davis-Richardson

Fasta file iterator. I created this gem because I was tired of copy-pasting dna.rb into my projects.


Coming soon: fastq, and qseq file formats.


```ruby

records = Dna.new('file.fasta')

records.each do |record|
  puts record.length
end

```