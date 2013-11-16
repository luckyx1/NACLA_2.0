class AddThumbnailLinkAndVolumeAndIssueAndDownloadLinkFromArticles < ActiveRecord::Migration
  def change
    add_column :articles, :thumbnail_link, :string
    add_column :articles, :volume, :integer
    add_column :articles, :issue, :integer
    add_column :articles, :download_link, :string
  end
end
