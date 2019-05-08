class CreateCollaborators < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborators do |t|
      t.string :name, null: false
      t.string :role
      t.string :linkedin
      t.string :message

      t.timestamps
    end
  end
end
