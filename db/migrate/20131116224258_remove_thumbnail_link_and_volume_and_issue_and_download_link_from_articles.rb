class RemoveThumbnailLinkAndVolumeAndIssueAndDownloadLinkFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :thumbnail_link
    remove_column :articles, :volume
    remove_column :articles, :issue
    remove_column :articles, :donwload_link
  end

  def down
    add_column :articles, :donwload_link, :string
    add_column :articles, :issue, :integer
    add_column :articles, :volume, :integer
    add_column :articles, :thumbnail_link, :string
  end
end
