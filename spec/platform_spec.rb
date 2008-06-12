$:.push('lib')
require 'preferences'
include Preferences

describe Platform do
  
  describe 'system' do
    it "should not raise an exception" do
      lambda { Platform.config_directory_system }.should_not raise_error
    end

    it "should return a non-nil value" do
      Platform.config_directory_system.should_not == nil
    end
  end

  describe 'user' do
    it "should not raise an exception" do
      lambda { Platform.config_directory_user }.should_not raise_error
    end

    it "should return a non-nil value" do
      Platform.config_directory_user.should_not == nil
    end
  end

  describe 'test' do
    it "should not raise an exception" do
      lambda { Platform.config_directory_test }.should_not raise_error
    end

    it "should return a non-nil value" do
      Platform.config_directory_test.should_not == nil
    end
  end
  
end