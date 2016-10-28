# Robot class to run under multiplexing infrastructure
module Robots       # Robot package
  module DorRepo    # Use DorRepo/SdrRepo to avoid name collision with Dor module
    module DpgImage   # This is your workflow package name (using CamelCase)
      class GoobiNotify # This is your robot name (using CamelCase)
        # Build off the base robot implementation which implements
        # features common to all robots
        include LyberCore::Robot

        def initialize
          super('dor', Dor::Config.dpg.workflow_name, 'gooby-notify', check_queued_status: true) # init LyberCore::Robot
        end

        # `perform` is the main entry point for the robot. This is where
        # all of the robot's work is done.
        #
        # @param [String] druid -- the Druid identifier for the object to process
        def perform(druid)
          LyberCore::Log.debug "goobi-notify working on #{druid}"
          handler = proc do |exception, attempt_number, _total_delay|
            LyberCore::Log.debug "#{exception.class} on dor-services-app update_marc_record call #{attempt_number} for #{@druid}" if attempt_number >= Dor::Config.dpg.max_tries
          end

          with_retries(max_tries: Dor::Config.dpg.max_tries, handler: handler, base_sleep_seconds: Dor::Config.dpg.base_sleep_seconds, max_sleep_seconds: Dor::Config.dpg.max_sleep_seconds) do |_attempt|
            url = "#{Dor::Config.dor.service_root}/objects/#{druid}/notify_goobi"
            response = RestClient.post url,{}
            response.code  
          end                         
        end
      end
    end
  end
end
