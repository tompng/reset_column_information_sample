# reset_column_information sample

## fail
```sh
$ rm db/development.sqlite3
$ bundle exec rake db:migrate
...
[foo, bar] (should not be nil)
[[5, nil], [6, nil], [7, nil]]
...
```

## success
```sh
$ rm db/development.sqlite3
$ bundle exec rake db:migrate VERSION=20170000000000
$ bundle exec rake db:migrate VERSION=20170000000001
$ bundle exec rake db:migrate VERSION=20170000000002
...
[foo, bar] (should not be nil)
[[5, 25], [6, 36], [7, 49]]
...
```

## success
```sh
$ rm db/development.sqlite3
$ RESET_COLUMN_INFORMATION=true bundle exec rake db:migrate
$ # ↑ klass.reset_column_information if ENV['RESET_COLUMN_INFORMATION']
...
[foo, bar] (should not be nil)
[[5, 25], [6, 36], [7, 49]]
...
```
