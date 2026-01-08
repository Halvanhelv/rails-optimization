# StrongMigrations

An excellent tool that prevents dangerous migrations.

And also an excellent knowledge base on these dangerous migrations.

```ruby
class AddIndexOnPublishedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_index :articles, :published
  end
end
```

```
rake db:migrate

=== Dangerous operation detected #strong_migrations ===
Adding a non-concurrent index locks the table. Instead, use:
class AddIndexOnPublishedToArticles < ActiveRecord::Migration[5.1]
  disable_ddl_transaction!
  def change
    add_index :articles, :published, algorithm: :concurrently
  end
end
```

```ruby
# config/initializers/strong_migrations.rb
# Gem was added 2018.04.06 and should not affect old migrations.
StrongMigrations.start_after = 20180406000000

# Automatically run analyze on table after adding index
StrongMigrations.auto_analyze = true

# Tell fuckup story about index removal!
```
