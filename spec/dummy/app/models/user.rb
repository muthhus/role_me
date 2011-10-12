class User < ActiveRecord::Base
  include RoleMe::HasRoles

  has_roles

end
