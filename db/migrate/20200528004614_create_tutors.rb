class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|

      t.timestamps
    end
  end
end
