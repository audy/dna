require 'spec_helper'

describe Fasta do
	
	let (:fasta) { Fasta.new name: 'test', sequence: 'GATC'}
	
	it 'can be created' do
		fasta.should_not be_nil
	end
	
	it 'has a name' do
		fasta.name.should_not be_nil
	end
	
	it 'has a sequence' do
		fasta.sequence.should_not be_nil
	end
end