class CreateHoge < ActiveRecord::Migration[5.0]
  def change
    create_table :hoges do |t|
      t.string :name
    end
  end

  def down
    raise
  end
end
