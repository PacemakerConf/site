require 'rails_helper'

describe SpeakersController do
	
	describe 'GET #show' do
		it 'assign requested speaker to @speaker' do
			speaker = FactoryGirl.create(:speaker)
			get :show, id: speaker
			expect(assigns(:speaker)).to eq(speaker)
		end

		it 'render :show template' do
			speaker = FactoryGirl.create(:speaker)
			get :show, id: speaker
			expect(response).to render_template :show
		end
	end

	describe 'GET #new' do
		xit 'assign a new speaker to @speaker' do
			get :new
			expect(assigns(:speaker)).to be_a_new(Speaker)
		end

		xit 'render the :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'POST #create' do
		context 'with valid attr'	do
			xit 'save new speaker to db' do
				expect{ post :create, speaker: FactoryGirl.attributes_for(:speaker)
					}.to change(Speaker, :count).by(1) 
			end

			xit 'redirect to events#new' do
				post :create, speaker: FactoryGirl.attributes_for(:speaker)
				expect(response).to redirect_to new_event_path
			end
		end

		context 'with invalid attr' do
			xit 'does not save new speaker t db' do
				expect{ post :create, speaker: FactoryGirl.attributes_for(:invalid_speaker)}.to_not change(Speaker, :count)
			end

			xit 're-render :new template' do
				post :create, speaker: FactoryGirl.attributes_for(:invalid_speaker)
				expect(response).to render_template :new
			end
		end
	end

end