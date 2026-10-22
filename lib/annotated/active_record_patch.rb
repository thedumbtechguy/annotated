# monkey patches

module ::ActiveRecord
  class Base
    # Ignores unknown or unloaded macros so parsing a model doesn't fail.
    # There is deliberately no respond_to_missing?: Rails asks
    # ActiveRecord::Base.respond_to? before defining a scope or enum, and
    # answering true for every name makes it refuse all of them.
    def self.method_missing(_name, *_args) # standard:disable Style/MissingRespondToMissing
    end
  end
end
