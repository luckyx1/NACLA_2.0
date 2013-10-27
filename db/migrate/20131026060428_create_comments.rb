class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :comment
    	t.string :user
    	t.string :privacy
    	t.datetime :postdate
    	t.string :article

      t.timestamps
    end
  end
end
