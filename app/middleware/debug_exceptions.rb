##
# Disable the default DebugException rendering
# since it rescues the exception and renders it in view
#
# We can deal with debug/production environment in our own exception handler
##
module ActionDispatch
  class DebugExceptions
    def render_exception(env, exception)
      raise exception
    end
  end
end
