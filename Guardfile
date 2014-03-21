# A sample Guardfile
# More info at https://github.com/guard/guard#readme

require 'guard/plugin'

module::Guard
  class InlineGuard < ::Guard::Plugin
    COMMAND='make test'
    def initialize(args)
      super(args)
      @runable = true
    end
    def run_all
      if (@isRunable)
        @running = true
        system(COMMAND)
        @runable = false
      end
    end
    def run_on_changes(paths)
      run_all
    end
  end
end

guard :inline_guard do
  watch /.*\.[mh]$/
end

