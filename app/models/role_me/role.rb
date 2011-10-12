class RoleMe::Role < ActiveRecord::Base

  scope :with_name, lambda { |role_name| where(:name => role_name).limit(1) }


  def self.create_with_name(role_name)
    self.create(:name => role_name)
  end

end
