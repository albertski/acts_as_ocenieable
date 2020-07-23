require "acts_as_ocenieable/ocenieable"

RSpec.describe ActsAsOcenieable::Ocenieable do
  it "should not be rateable" do
    expect(User).not_to be_rateable
  end

  it "should be rateable" do
    expect(Book).to be_rateable
  end
end
