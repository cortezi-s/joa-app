class ArticlesModifications < ActiveRecord::Migration[6.0]
  def change
  	remove_column :articles, :subtitle, :string
  	remove_column :articles, :content, :text
  	add_column :articles, :source, :string
  	add_column :articles, :link, :string
  end
end
