module Flan
  module ControllerMethods
    private # Included in controllers, shouldn't be exposed as actions

      def flan(type, name)
        flash["flan_#{type}"] ||= []
        flash["flan_#{type}"] << name
      end
  end
end
