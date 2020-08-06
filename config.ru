require './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#where is where I will mount other controllers with our key word 'use'
#In order to send PATCH and DELETE request I need the code below: 

use Rack::MethodOverride 

use UsersController

use ListsController

run ApplicationController
