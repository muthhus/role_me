module RoleMe
  module HasRoles
    extend ActiveSupport::Concern

    module ClassMethods
      # Adds roles to the model. options:
      #
      # * :role_class => "RoleMe::Roles"
      #   Sets the default model that holds roles.
      #   Default: "RoleMe::Roles"
      #
      # * :role_join_table => "role_me_roles_join"
      #   Table to hold the has_and_belongs_to_many keys
      #   Default : "role_me_roles_join"
      #
      #   Examples:
      #
      #   * has_role
      #
      #   * has_role :role_class => "Role"
      #
      #
      def has_roles options = {}
        return if self.included_modules.include?(RoleMe::HasRolesMethods)

        attr_accessor :role_me_options

        options.reverse_merge!({
          :role_class       => "RoleMe::Roles",
          :role_join_table  => "role_me_roles_join"
        })

        self.role_me_roles_join = options

        self.send(:include, RoleMe::HasRolesMethods)
      end
    end

  end

  module HasRolesMethods
    included do

    end

    module InstanceMethods

      # Adds the role to the model
      #
      def has_role! role

      end

      # Check if the model has the role
      #
      def has_role? role

      end

    end

  end

end
