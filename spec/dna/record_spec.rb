require 'spec_helper'

describe Record do
	
	let (:record) { Record.new name: 'test', sequence: 'GATC'}
	
	it 'can be created' do
		record.should_not be_nil
	end
	
	it 'has a name' do
		record.name.should_not be_nil
	end
	
	it 'has a sequence' do
		record.sequence.should_not be_nil
	end
end