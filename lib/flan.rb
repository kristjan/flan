require File.join(File.dirname(__FILE__), 'flan', 'controller_methods')
require File.join(File.dirname(__FILE__), 'flan', 'view_helpers')

module Flan
  def self.included(base)
    base.send(:include, Flan::ControllerMethods)
    base.send(:helper,  Flan::ViewHelpers)
  end
end
