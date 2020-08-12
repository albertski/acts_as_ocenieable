RSpec.describe Book do
  let(:book) { create(:book) }
  let(:user) { create(:user) }

  it "should have one rating when saved" do
    book.rate_by rater: user, rating: 1
    expect(book.ocenies.size).to eq(1)
  end

  it "should have one rating when rating on twice by the same person and same type" do
    book.rate_by rater: user, rating: 1, type: "Story"
    book.rate_by rater: user, rating: 0, type: "Story"
    expect(book.ocenies.size).to eq(1)
  end

  it "should have 2 ratings when rating on twice by the same person and different types" do
    book.rate_by rater: user, rating: 5, type: "Story"
    book.rate_by rater: user, rating: 10, type: "Performance"
    expect(book.ocenies.size).to eq(2)
  end

  it "should not count the rating as being registered if that rating has already voted and the vote has not changed" do
    book.rate_by rater: user, rating: 1, type: "Story"
    book.rate_by rater: user, rating: 1, type: "Story"
    expect(book.ocenie_registered?).to be false
  end
end
