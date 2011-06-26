require 'spec_helper'

describe Flan::ControllerMethods do
  context "#flan" do
    before(:all) do
      TestController.send(:include, Flan)
      TestController.send(:public, :flan)
    end

    before(:each) do
      @controller = TestController.new
      @controller.flan :pudding, "caramel"
    end

    it "sets the flash key" do
      @controller.flash.should have_key('flan_pudding')
    end

    it "stores the value" do
      @controller.flash['flan_pudding'].size.should == 1
      @controller.flash['flan_pudding'].should include('caramel')
    end

    it "stores multiple values" do
      @controller.flan :pudding, 'chocolate'
      @controller.flash['flan_pudding'].size.should == 2
      @controller.flash['flan_pudding'].should include('caramel')
      @controller.flash['flan_pudding'].should include('chocolate')
    end
  end
end
