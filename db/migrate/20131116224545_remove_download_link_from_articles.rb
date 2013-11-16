class RemoveDownloadLinkFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :download_link
  end

  def down
    add_column :articles, :download_link, :string
  end
end
