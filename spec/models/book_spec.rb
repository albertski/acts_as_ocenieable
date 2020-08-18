
RSpec.describe Book, type: :model do
  it "has a valid factory" do
    book = create(:book)
    expect(book).to be_valid
  end

  it "builds ocenies" do
    book = create(:book)
    expect(book.build_ocenies.to_ary.count).to equal(6)
  end

  it "adds default values" do
    book = create(:book)
    ocenie = book.build_ocenies.first
    expect(ocenie.rating_type_category).to eq("science_fiction")
    expect(ocenie.rating_type).to eq("Writing")
    expect(ocenie.max_rating.to_s).to eq("10.0")
  end

  it "should only save items with ratings" do
    book = create(:book)
    book.build_ocenies
    book.ocenies.first.rating = 2.0
    book.ocenies.second.rating = 3.0
    book.save
    expect(book.ocenies.count).to equal(2)
  end
end
