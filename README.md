# reset_column_information sample

```ruby
def up
  add_column :hoges, :bar, :integer
  klass = Class.new(ActiveRecord::Base) { self.table_name = :hoges }
  # klass.reset_column_information
  klass.all.each { |h| h.update! bar: h.foo**2 } # bar should be non_nil
  remove_column :hoges, :foo
end
```

## fail
```
$ rm db/development.sqlite3
$ bundle exec rake db:migrate
$ rails c
irb(main):001:0> Hoge.pluck :bar
=> [nil, nil, nil]
```

## success
```
$ rm db/development.sqlite3
$ bundle exec rake db:migrate VERSION=20170000000000
$ bundle exec rake db:migrate VERSION=20170000000001
$ bundle exec rake db:migrate VERSION=20170000000002
$ rails c
irb(main):001:0> Hoge.pluck :bar
=> [25, 36, 49]
```

## success
```
$ rm db/development.sqlite3
$ RESET_COLUMN_INFORMATION=true bundle exec rake db:migrate
$ # ↑ klass.reset_column_information if ENV['RESET_COLUMN_INFORMATION']
$ rails c
irb(main):001:0> Hoge.pluck :bar
=> [25, 36, 49]
```
