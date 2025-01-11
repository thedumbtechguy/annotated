require_relative "../spec_helper"

describe Annotated do
  describe ".version" do
    it "has version" do
      expect(Annotated.version).to be_instance_of(String)
    end
  end
end
