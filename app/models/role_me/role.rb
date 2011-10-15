# Role Model
#
class RoleMe::Role < ActiveRecord::Base

  set_table_name :role_me_roles

  scope :with_name, lambda { |role_name| where(:name => role_name).limit(1) }

end
