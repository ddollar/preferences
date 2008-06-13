$:.push('lib')
require 'preferences'
include Preferences

describe Preferences do
  
  describe 'rspec' do

    it "should have a version" do
      lambda { Preferences.version }.should_not raise_error
    end
    
    it "should have a libpath" do
      lambda { Preferences.libpath }.should_not raise_error
    end
    
    it "should have a path" do
      lambda { Preferences.path }.should_not raise_error
    end

  end
  
end