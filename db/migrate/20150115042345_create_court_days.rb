class CreateCourtDays < ActiveRecord::Migration
  def change
    create_table :court_days do |t|
      t.date :court_date, null: false
      t.integer :count, null: false
      t.text :source_text

      t.timestamps null: false
    end
  end
end
