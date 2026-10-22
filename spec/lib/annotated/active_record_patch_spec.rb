require_relative "../../spec_helper"
require "annotated/active_record_patch"

describe "ActiveRecord::Base patch" do
  it "ignores unknown class macros" do
    expect { ActiveRecord::Base.some_unloaded_macro(:arg) }.not_to raise_error
  end

  # Rails checks ActiveRecord::Base.respond_to? before defining a scope or
  # enum, so claiming every name would make it refuse all of them.
  it "does not claim to respond to unknown class methods" do
    expect(ActiveRecord::Base.respond_to?(:verified, true)).to be(false)
  end
end
