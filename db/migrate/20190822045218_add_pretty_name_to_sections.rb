class AddPrettyNameToSections < ActiveRecord::Migration[6.0]
  def change
  	add_column :sections, :pretty_name, :string
  end
end
