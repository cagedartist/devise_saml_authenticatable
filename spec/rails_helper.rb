ENV["RAILS_ENV"] ||= 'test'

require 'spec_helper'

create_app('sp', 'USE_SUBJECT_TO_AUTHENTICATE' => "false")
require 'support/sp/config/environment'
require 'rspec/rails'

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = Logger.new(nil)
ActiveRecord::Migrator.migrate(File.expand_path("../support/sp/db/migrate/", __FILE__))

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end

Devise.setup do |config|
  config.saml_default_user_key = :email
  config.saml_session_index_key = :session_index
end
