class ExceptionHandler
  class << self
    def call(env)
      render_exception(env)
      ##
      # Should have a failsafe for rendering
      ##
      # begin
      #   render_exception(env)
      # rescue Exception => exception
      #   # failsafe
      # end


    end


    def render_exception(env)
      exception = env["action_dispatch.exception"]
      wrapper = ActionDispatch::ExceptionWrapper.new(env, exception)

      [
        wrapper.status_code,
        { 'Content-Type' => 'application/json' },
        [
          {
            error: {
              exception_class: exception.class.name,
              message: exception.message,
              backtrace: wrapper.application_trace || wrapper.framework_trace,
              airbrake_id: env['airbrake.error_id']
            },
          }.to_json
        ]
      ]
    end

    def raw_exception
      env["action_dispatch.exception"]
    end
  end
end
