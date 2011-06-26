require 'spec_helper'

describe Flan do
  context "including Flan" do
    it "adds #flan as a private method" do
      TestController.send(:include, Flan)
      TestController.new.private_methods.should include('flan')
    end

    it "adds the ViewHelpers" do
      TestController.should_receive(:helper).with(Flan::ViewHelpers)
      TestController.send(:include, Flan)
    end
  end
end
