module RoleMe
  class RoleMigrationGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def create_role_migration
      migration_template "create_role_me_roles.rb", File.join("db", "migrate", "create_role_me_roles.rb")
      sleep(1)
    end

    def create_role_join_table_migration
      migration_template "create_role_me_roles_join.rb", File.join("db", "migrate", "create_role_me_roles_join.rb")
      sleep(1)
    end

    private

    def self.next_migration_number(dirname) #:nodoc:
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

  end
end
