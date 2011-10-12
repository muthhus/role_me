module RoleMe
  module HasRoles
    extend ActiveSupport::Concern

    module ClassMethods
      # Adds roles to the model. options:
      #
      # * :role_class => "RoleMe::Role"
      #   Sets the default model that holds roles.
      #   Default: "RoleMe::Role"
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
          :role_class       => "RoleMe::Role",
          :role_join_table  => "role_me_roles_join"
        })

        self.role_me_roles_join = options

        self.send(:include, RoleMe::HasRolesMethods)
      end
    end

  end

  # Module included when you call the has_role in a model
  #
  module HasRolesMethods
    module InstanceMethods

      # Adds the role to the model
      #
      # Example:
      #
      #   user.has_role! :admin
      #   -> will add the admin role to user
      #
      def has_role! role

      end

      # Check if the model has the role
      #
      # Example:
      #
      #   user.has_role? :admin
      #   -> will return true if the user has the admin role
      #
      def has_role? role

      end

    end
  end
end
