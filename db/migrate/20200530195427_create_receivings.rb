class CreateReceivings < ActiveRecord::Migration[6.0]
  def change
    create_table :receivings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
