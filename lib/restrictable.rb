require "restrictable/version"
require "rails"
require "restrictable/railtie.rb" if defined?(::Rails)

module Restrictable
  module ControllerMethods
    extend ActiveSupport::Concern

    included do
      # Controller helper for denying access from user roles
      # Example of use:
      #   prevent :seller, to: :destroy
      #   prevent :supervisor, to: [:update, :edit, :delete, :destroy], fail: true
      def self.prevent(user_role, options={})
        options[:only] = options[:to]
        should_fail = options[:fail] || false
        curated_options = options.except(:to, :fail)    
        role = user_role.to_s

        before_action curated_options do |controller|
          not_permitted = User.roles.keys.exclude?(role) || current_user.role == role
          if not_permitted
            if should_fail
              raise "#{current_user.role} doesn't have access to this route or action"
            else
              controller.not_allowed_action
            end
          end
        end
      end

      # Controller helper for denying access from user roles
      # Example of use:
      #   only_allow :admin, to: [:destroy, :edit, :update]
      #   only_allow :seller, to: :destroy, fail: true
      def self.only_allow(user_role, options={})
        options[:only] = options[:to]
        should_fail = options[:fail] || false
        curated_options = options.except(:to, :fail)
        role = user_role.to_s

        before_action curated_options do |controller|
          not_permitted = current_user.role != role
          if not_permitted
            if should_fail
              raise "#{current_user.role} doesn't have access to this route or action"            
            else
              controller.not_allowed_action
            end
          end
        end
      end

      def not_allowed_action
        head :forbidden
      end
    end

  end
end
