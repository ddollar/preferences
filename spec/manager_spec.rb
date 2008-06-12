$:.push('lib')
require 'preferences'
include Preferences

describe Manager do
  
  def create_manager(settings={})
    settings[:type] = :test
    @creator = lambda { Manager.new('rspec', settings) }
    FileUtils.rm_f(@creator.call.filename)
    @manager = @creator.call
  end
  
  describe 'manager', :shared => true do
    
    it "should allow for setting and retreival of values" do
      create_manager
      @manager[:foo] = 'bar'
      @manager[:foo].should == 'bar'
    end
    
    it "should be able to retrieve values after saving" do
      create_manager
      @manager[:foo] = 'bar'
      @manager.save
      @manager2 = @creator.call
      @manager.should == @manager2
      @manager2[:foo].should == 'bar'
    end
  
  end
  
  describe 'regular' do

    it_should_behave_like 'manager'
    
    it "should not save values without calling save" do
      create_manager
      @manager[:foo] = 'bar'
      @manager2 = @creator.call
      @manager.should_not == @manager2
      @manager2[:foo].should_not == 'bar'
    end

  end
  
  describe 'autosave' do
    
    it_should_behave_like 'manager'

    it "should save values without calling save" do
      create_manager(:autosave => true)
      @manager[:foo] = 'bar'
      @manager2 = @creator.call
      @manager.should == @manager2
      @manager2[:foo].should == 'bar'
    end
    
  end
  
end