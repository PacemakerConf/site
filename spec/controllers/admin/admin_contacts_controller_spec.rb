require 'rails_helper'

describe Admin::ContactsController do

	before :each do	
		@admin = FactoryGirl.create(:admin)
		sign_in :admin, @admin
	end

	describe 'GET #show' do
		before :each do
			@contact = FactoryGirl.create(:contact)
		end
	
		it 'assigns requested contact to @contact' do
			get :show, id: @contact
			expect(assigns(:contact)).to eq(@contact)
		end

		it 'render the :show template' do
			get :show, id: @contact
			expect(response).to render_template :show
		end
	end

	describe 'GET #index' do
		#it 'assigns all contacts to @contacts' do
			#soft1 = FactoryGirl.create(:contact)
			#soft2 = FactoryGirl.create(:contact)
			#get :index
			#expect(assigns(:contacts)).to eq([soft1, soft2])
		#end

		it 'render index template' do
			get :index
			expect(response).to render_template :index
		end
	end


	describe 'GET #new' do
		it 'assigns new contact to @contact' do
			get :new
			expect(assigns(:contact)).to be_a_new(Contact)
		end

		it 'render :new template' do
			get :new
			expect(response).to render_template :new
		end
	end

	describe 'GET #edit' do
		before :each do
			@contact = FactoryGirl.create(:contact)
		end
	
		it 'assigns requested contact to @contact' do
			get :edit, id: @contact
			expect(assigns(:contact)).to eq(@contact)
		end
	
		it 'render the :edit template' do
			get :edit, id: @contact
			expect(response).to render_template :edit
		end
	end

	describe 'POST #create' do

		context 'with valid parameters' do

			it 'save new contact to DB' do
				expect{ post :create, contact: FactoryGirl.attributes_for(:contact)}.to change(Contact, :count).by(1)
			end

			it 'redirect to admin_conference_path' do
				post :create, contact: FactoryGirl.attributes_for(:contact)
				expect(response).to redirect_to admin_contacts_path
			end
		end

		context 'with invalid attr' do
			it 'doesnt save new contact to database' do
				expect{ post :create, contact: FactoryGirl.attributes_for(:contact, name: nil)}.not_to change(Contact, :count)
			end

			it 're-render :new template' do
				post :create, contact: FactoryGirl.attributes_for(:contact, name: nil)
				expect(response).to render_template :new
			end
		end
	end
  	
  	describe 'PATCH update' do
		before :each do
			@contact = FactoryGirl.create(:contact)
		end

		context 'with valid attr' do
			it 'asstign the requested contact to @contact' do
				patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact)
				expect(assigns(:contact)).to eq(@contact)
			end
			
			it 'change @contact attr' do
				patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact, name: 'Vadym' )
				@contact.reload
				expect(@contact.name).to eq("Vadym")
			end

			#it 'redirect to admin_contacts_path' do
				#patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact)
				#expect(response).to redirect_to admin_contacts_path
			#end
		end

		context 'with invalid attr' do
			it 'doesnt change contact attr' do
				patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact, name: "Vad")
				@contact.reload
				expect(@contact.name).not_to eq("Vadym")
			end

			it 're-render edit template' do
				patch :update, id: @contact, contact: FactoryGirl.attributes_for(:contact, name: nil)
				@contact.reload
				expect(response).to render_template :edit
			end
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@contact = FactoryGirl.create(:contact)
		end

		it 'delete the contact' do
			expect{delete :destroy, id: @contact}.to change(Contact, :count).by(-1)
		end

		it 'redirect to contacts#index' do
			delete :destroy, id: @contact
			expect(response).to redirect_to admin_contacts_path
		end			
	end
 
end

	


