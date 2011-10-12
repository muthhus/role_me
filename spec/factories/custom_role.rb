Factory.define :custom_role do |c|
  c.sequence(:name) {|n| "role_#{n}_#{Random.rand 1000}"}
end
