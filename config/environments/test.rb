# frozen_string_literal: true

Dor::Config.configure do
  workflow.url 'https://example.com/workflow/'
  solr.url 'http://localhost:8080/solr/argo'

  robots do
    workspace '/tmp'
  end

  goobi do
    workflow_name 'goobiWF'
    max_tries 1 # the number of attempts to retry service calls before failing
    max_sleep_seconds 20 # max sleep seconds between tries
    base_sleep_seconds 5 # base sleep seconds between tries
  end

  dor_services do
    url 'https://example.com/dor'
    username 'USERNAME'
    password 'PASSWORD'
  end
end

REDIS_URL = '127.0.0.1:6379/resque:development' # hostname:port[:db]/namespace
# REDIS_TIMEOUT = '5' # seconds
