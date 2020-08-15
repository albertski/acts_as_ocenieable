RSpec.feature "Book", type: :feature do
  context "Book form" do
    scenario "Can see all ocenieable rating types and categories" do
      visit "/books/new"
      expect(page).to have_text("science_fiction - Writing")
      expect(page).to have_text("science_fiction - Plot")
      expect(page).to have_text("science_fiction - Character")
      expect(page).to have_text("science_fiction - World Building")
      expect(page).to have_text("science_fiction - Writing")
      expect(page).to have_text("science_fiction - Plot")
    end
  end
end
