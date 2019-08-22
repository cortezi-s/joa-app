class AddPositionToCollaboratorsAndProjects < ActiveRecord::Migration[6.0]
  def change
		add_column :collaborators, :position, :integer
		Collaborator.order(:updated_at).each.with_index(1) do |collaborator, index|
			collaborator.update_column :position, index
		end
		add_column :projects, :position, :integer
		Project.order(:updated_at).each.with_index(1) do |project, index|
			project.update_column :position, index
		end
  end
end
