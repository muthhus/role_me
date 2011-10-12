class CustomRoled < ActiveRecord::Base
  include RoleMe::HasRoles

  has_roles :role_class_name => "CustomRole",
            :role_join_table => "custom_roles_join"

end
