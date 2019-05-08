class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :company_name, null: false
      t.datetime :date
      t.string :description, null: false
      t.string :founders
      t.string :linkedin
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :homepage
      t.string :location

      t.timestamps
    end
  end
end
