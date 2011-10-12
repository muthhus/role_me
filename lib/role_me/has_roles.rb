module RoleMe
  module HasRoles
    extend ActiveSupport::Concern

    module ClassMethods
      # Adds roles to the model. options:
      #
      # * :role_class_name => "RoleMe::Role"
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
      #   * has_role :role_class_name => "Role"
      #
      #
      def has_roles(options = {})
        return if self.included_modules.include?(RoleMe::HasRolesMethods)

        cattr_accessor :role_me_options

        options.reverse_merge!({
          :role_class       => "RoleMe::Role",
          :join_table  => "role_me_roles_join"
        })

        self.role_me_options = options

        self.send(:include, RoleMe::HasRolesMethods)
      end
    end

  end

  # Module included when you call the has_role in a model
  #
  module HasRolesMethods
    extend ActiveSupport::Concern

    included do

      has_and_belongs_to_many :roles,
                              :class_name => self.role_me_options[:role_class_name],
                              :join_table => self.role_me_options[:role_join_table]

    end

    module InstanceMethods

      # Adds the role to the model
      #
      # Example:
      #
      #   user.has_role! :admin
      #   -> will add the admin role to user
      #
      def has_role!(role_name)
        return if has_role?(role_model)
        self.roles << find_or_create_role_by_name(role.to_s)
      end

      # Check if the model has the role
      #
      # Example:
      #
      #   user.has_role? :admin
      #   -> will return true if the user has the admin role
      #
      def has_role?(role_name)
        if self.roles.by_name(role_name.to_s).all.empty?
          false
        else
          true
        end
      end

      private

      # Checks if the role exists or create a new one
      # and returns it
      def find_or_create_role_by_name(role_name)
        begin
         self.options[:role_class].constantize.by_name(role_name)
        rescue
          self.options[:role_class].constantize.create_with_name(role_name)
        end
      end

    end
  end
end
