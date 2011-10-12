# Role Model
#
class RoleMe::Role < ActiveRecord::Base

  scope :with_name, lambda { |role_name| where(:name => role_name).limit(1) }

end
