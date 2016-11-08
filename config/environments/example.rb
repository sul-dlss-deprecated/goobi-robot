Dor::Config.configure do

  workflow.url 'https://example.com/workflow/'
  solr.url 'http://localhost:8080/solr/argo'
  
  robots do 
    workspace '/tmp'
  end
  
  goobi do
    workflow_name 'goobiWF'
    max_tries  3  # the number of attempts to retry service calls before failing
    max_sleep_seconds   60  # max sleep seconds between tries
    base_sleep_seconds  5   # base sleep seconds between tries       
  end
  
  dor do
    service_root 'https://USERNAME:PASSWORD@example.com/dor/v1'
  end
   
end

REDIS_URL = '127.0.0.1:6379/resque:development' # hostname:port[:db]/namespace
# REDIS_TIMEOUT = '5' # seconds
