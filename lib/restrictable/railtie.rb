module Restrictable
  class RestrictableRailtie < Rails::Railtie
    initializer "restrictable_railtie.extend_action_controller" do
      ActiveSupport.on_load :action_controller do
        # At this point, self == ActionController::Base
        include Restrictable::ControllerMethods
      end
    end
  end
end