require 'rails_helper'

describe Admin::SpeakersController do
	
	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end 

	describe 'GET invite' do
		it ''
	end

	describe 'POST send invitation' do
		it ''
	end

	describe 'GET #show' do
		before :each do
			@speaker = FactoryGirl.create(:speaker)
		end
	
		it 'assigns requested speaker to @speaker' do
			get :show, id: @speaker
			expect(assigns(:speaker)).to eq(@speaker)
		end

		it 'render the :show template' do
			get :show, id: @speaker
			expect(response).to render_template :show
		end
	end


	describe 'GET #index' do
		it 'assigns all speakers to @speakers' do
			first = FactoryGirl.create(:speaker)
			second = FactoryGirl.create(:speaker)
			get :index
			expect(assigns(:speakers)).to eq([first, second])
		end

		it 'render index template' do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'GET #new' do
		it 'assigns new speaker to @speaker' do
			get :new
			expect(assigns(:speaker)).to be_a_new(Speaker)
		end

		it 'render :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before :each do
			@speaker = FactoryGirl.create(:speaker)
		end
	
		it 'assigns requested speaker to @speaker' do
			get :edit, id: @speaker
			expect(assigns(:speaker)).to eq(@speaker)
		end
	
		it 'render the :edit template' do
			get :edit, id: @speaker
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do

		context 'with valid parameters' do

			it 'save new speaker to DB' do
				expect{ post :create, speaker: FactoryGirl.attributes_for(:speaker)
					}.to change(Speaker, :count).by(1)
			end

			it 'redirect to admin_speakers_path' do
				post :create, speaker: FactoryGirl.attributes_for(:speaker)
				expect(response).to redirect_to admin_speakers_path
			end
		end

		context 'with invalid attr' do
			it 'doesn\'t save new speaker to DB' do
				expect{ post :create, speaker: FactoryGirl.attributes_for(:speaker, name: nil)}.not_to change(Speaker, :count)
			end

			it 're-render :new template' do
				post :create, speaker: FactoryGirl.attributes_for(:speaker, name: nil)
				expect(response).to render_template :new
			end
		end
	end

	describe 'PATCH update' do
		before :each do
			@speaker = FactoryGirl.create(:speaker)
		end

		context 'with valid attr' do
			it 'asstign the requested speaker to @speaker' do
				patch :update, id: @speaker, speaker: FactoryGirl.attributes_for(:speaker)
				expect(assigns(:speaker)).to eq(@speaker)
			end
			
			it 'change @speaker attr' do
				patch :update, id: @speaker, speaker: FactoryGirl.attributes_for(:speaker, name: 'Frodo' )
				@speaker.reload
				expect(@speaker.name).to eq("Frodo")
			end

			it 'redirect to admin_speakers_path' do
				patch :update, id: @speaker, speaker: FactoryGirl.attributes_for(:speaker)
				expect(response).to redirect_to admin_speakers_path
			end
		end

		context 'with invalid attr' do
			it 'doesn\'t change speaker attr' do
				patch :update, id: @speaker, speaker: FactoryGirl.attributes_for(:speaker, name: nil, surname: 'Baggins')
				@speaker.reload
				expect(@speaker.surname).not_to eq("Baggins")
			end

			it 're-render edit template' do
				patch :update, id: @speaker, speaker: FactoryGirl.attributes_for(:speaker, name: nil)
				@speaker.reload
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@speaker = FactoryGirl.create(:speaker)
		end

		it 'delete the speaker' do
			expect{delete :destroy, id: @speaker}.to change(Speaker, :count).by(-1)
		end

		it 'redirect to speakers#index' do
			delete :destroy, id: @speaker
			expect(response).to redirect_to admin_speakers_path
		end			
	end

end