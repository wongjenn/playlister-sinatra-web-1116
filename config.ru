require './config/environment'
require 'rack-flash'
require 'rack/flash/test'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
enable :sessions
use Rack::Flash
use SongController
use ArtistController
use GenreController
run ApplicationController
