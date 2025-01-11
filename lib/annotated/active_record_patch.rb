# monkey patches

module ::ActiveRecord
  class Base
    def self.method_missing(_name, *_args)
      # ignore this, so unknown/unloaded macros won't cause parsing to fail
    end

    def self.respond_to_missing?(_name, *_args)
      true
    end
  end
end
