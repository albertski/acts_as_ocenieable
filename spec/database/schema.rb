ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define(:version => 0) do
  create_table :ocenies, :force => true do |t|
    t.references :rateable, polymorphic: true
    t.references :rater, polymorphic: true
    t.string :name
    t.string :rating_type
    t.integer :rating
    t.integer :weight
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :users, :force => true do |t|
    t.text :name
  end

  create_table :books, :force => true do |t|
    t.text :title
  end
end
