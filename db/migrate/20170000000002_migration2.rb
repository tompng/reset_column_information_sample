class Migration2 < ActiveRecord::Migration[5.0]
  def log s
    puts "\e[1m#{s}\e[m"
  end

  def up
    add_column :hoges, :bar, :integer
    klass = Class.new(ActiveRecord::Base) { self.table_name = :hoges }
    klass.reset_column_information if ENV['RESET_COLUMN_INFORMATION']
    klass.all.each { |h| h.update! bar: h.foo**2 }
    log '[foo, bar] (should not be nil)'
    log klass.pluck(:foo, :bar).inspect
    remove_column :hoges, :foo
  end

  def down
    raise
  end
end
