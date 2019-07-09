class RemoveConstraints < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :articles, :title, true
  	change_column_null :articles, :content, true
  	change_column_null :collaborators, :name, true
  	change_column_null :projects, :company_name, true
  	change_column_null :projects, :description, true
  	change_column_null :projects, :description, true
  end
end
