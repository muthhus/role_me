Factory.define :role, :class => "RoleMe::Role" do |r|
  r.sequence(:name) { |n| "role_#{n}_#{Random.rand(199)}" }
end
