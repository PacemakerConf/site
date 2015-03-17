describe ConferenceController, "creating a new conference item" do
  integrate_views
  fixtures :conference_items
  
  it "should redirect to index with a notice on successful create" do
    ConferenceItem.any_instance.stubs(:valid?).returns(true)
    post 'create'
    assigns[:conference_item].should_not be_new_record
    flash[:notice].should_not be_nil
    response.should redirect_to(conference_items_path)
  end

  it "should re-render new template on failed save" do
    ConferenceItem.any_instance.stubs(:valid?).returns(false)
    post 'create'
    assigns[:conference_item].should be_new_record
    flash[:notice].should be_nil
    response.should render_template('new')
  end
  
  it "should pass params to conference item" do
    post 'create', :conference_item => { :name => 'Plain' }
    assigns[:conference_item].name.should == 'Plain'
  end
  
end