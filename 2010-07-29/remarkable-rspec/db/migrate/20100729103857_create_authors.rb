class CreateAuthors < ActiveRecord::Migration
  def self.up
    add_column :posts, :author_id, :integer
    add_index :posts, :author_id
    create_table :authors do |t|

      t.timestamps
    end
  end

  def self.down
    remove_column :posts, :author_id
    drop_table :authors
  end
end
