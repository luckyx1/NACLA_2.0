class UpdateComment < ActiveRecord::Migration
  def up
    remove_column :comments, :article
  end

  def down
    add_column :article, :string
  end
end
