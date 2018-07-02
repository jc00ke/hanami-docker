require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/spike'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/spike_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/spike_development'
    #    adapter :sql, 'mysql://localhost/spike_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/spike/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :debug, formatter: :json, filter: []

    mailer do
      delivery :test
    end
  end
end
