class ExceptionHandler
  class << self
    def call(env)
      render_exception(env)
    end

    def render_exception(env)
      wrapper = ActionDispatch::ExceptionWrapper.new(env, env["action_dispatch.exception"])

      [
        wrapper.status_code,
        { 'Content-Type' => 'application/json' },
        [
          { error: params(env, wrapper) }.to_json
        ]
      ]
    end

    def raw_exception
      env["action_dispatch.exception"]
    end

    def debug_params(wrapper)
      {
        source_extracts: wrapper.source_extracts,
        backtrace: wrapper.application_trace || wrapper.framework_trace,
        traces: wrapper.traces
      }
    end

    def params(env, wrapper)
      exception = wrapper.exception

      params = {
        exception_class: exception.class.name,
        message: exception.message,
        airbrake: {
          id: env['airbrake.error_id'],
          link: "http://airbrake.io/locate/#{env['airbrake.error_id']}"
        }
      }

      params.merge!(debug_params(wrapper)) unless Rails.env.production?
      params
    end
  end
end
