require 'rails_helper'
require 'shoulda/matchers'

describe MainMenu do

	before do
		@params = MainMenu.params
	end

	it 'should return sorted conferences' do
		expect(@params[0]).to eq(Conference.all.order(date: :asc))
	end

	it 'should return sorted years' do
		expect(@params[1]).to eq(Conference.all.uniq.pluck(:year).sort)
	end

	it 'should return last year' do
		expect(@params[2]).to eq(Conference.all.uniq.pluck(:year).sort[-1])
	end

end