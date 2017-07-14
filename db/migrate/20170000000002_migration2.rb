class Migration2 < ActiveRecord::Migration[5.0]
  def printlog *s
    puts "\e[1m#{s.join(' ')}\e[m"
  end

  def up
    add_column :hoges, :bar, :integer
    klass = Class.new(ActiveRecord::Base) { self.table_name = :hoges }
    klass.reset_column_information if ENV['RESET_COLUMN_INFORMATION']
    printlog 'foo', klass.all.map(&:foo).inspect
    klass.all.each do |h|
      h.update! bar: h.foo**2
    end
    printlog 'bar(should not be nil)', klass.all.map(&:bar).inspect
    remove_column :hoges, :foo
  end

  def down
    raise
  end
end
