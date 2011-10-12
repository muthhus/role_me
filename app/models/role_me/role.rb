module RoleMe
  class Role < ActiveRecord::Base

    scope :by_name, lambda { |role_name| where(:name => role_name).limit(1).first }

  end
end
