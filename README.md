# reset_column_information sample

## fail
```sh
$ rm db/development.sqlite3
$ bundle exec rake db:migrate
...
foo [5, 6, 7]
bar(should not be nil) [nil, nil, nil]
...
```

## success
```sh
$ rm db/development.sqlite3
$ bundle exec rake db:migrate VERSION=20170000000000
$ bundle exec rake db:migrate VERSION=20170000000001
$ bundle exec rake db:migrate VERSION=20170000000002
...
foo [5, 6, 7]
bar(should not be nil) [25, 36, 49]
...
```

## success
```sh
$ rm db/development.sqlite3
$ RESET_COLUMN_INFORMATION=true bundle exec rake db:migrate
$ # ↑ klass.reset_column_information if ENV['RESET_COLUMN_INFORMATION']
...
foo [5, 6, 7]
bar(should not be nil) [25, 36, 49]
...
```
