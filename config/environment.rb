require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/fuse_test'
require_relative '../apps/react/application'
require_relative '../apps/default/application'

Hanami.configure do
  mount React::Application, at: '/react'
  mount Default::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/fuse_test_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/fuse_test_development'
    #    adapter :sql, 'mysql://localhost/fuse_test_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/fuse_test/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
