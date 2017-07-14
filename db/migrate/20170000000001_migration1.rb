class Migration1 < ActiveRecord::Migration[5.0]
  def up
    add_column :hoges, :foo, :integer
    klass = Class.new(ActiveRecord::Base) { self.table_name = :hoges }
    klass.create! name: 'aaa', foo: 5
    klass.create! name: 'bbb', foo: 6
    klass.create! name: 'ccc', foo: 7
  end

  def down
    raise
  end
end
