
# require './config/environment'
#
# begin
#   fi_check_migration
#
#   use Rack::MethodOverride
#
#   run ApplicationController
# rescue ActiveRecord::PendingMigrationError => err
#   STDERR.puts err
#   exit 1
# end

require './config/environment'
require './app/controllers/application_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run ApplicationController
