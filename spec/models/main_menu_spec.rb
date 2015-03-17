require 'rails_helper'
require 'shoulda/matchers'

describe MainMenu do

	before  do
		@year_1 = FactoryGirl.create(:year, name: 2017)
		@year_2 = FactoryGirl.create(:year, name: 2018)
		@conf_1 = FactoryGirl.create(:conference, date: '01-01-2017')
		@conf_3 = FactoryGirl.create(:conference, date: '01-01-2018')
		@conf_2 = FactoryGirl.create(:conference, date: '01-03-2017')
		@params = MainMenu.params
	end

	it 'should return sorted conferences' do
		expect(@params[0]).to eq([@conf_1, @conf_2, @conf_3])
	end

	it 'should return sorted years' do
		expect(@params[1]).to eq(Year.all.order(name: :asc))
	end

	it 'should return last year' do
		expect(@params[2]).to eq(Year.all.order(name: :asc)[-1])
	end

end