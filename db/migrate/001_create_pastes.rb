class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.text :content
      t.timestamp :accessed_at
      t.integer :project_id
      t.timestamp :created_at
      t.timestamp :modified_at
      t.integer :user_id
    end
    add_index :pastes, :created_at, name=> 'index_pastes_on_creation'
    add_index :pastes, :user_id, name=> 'index_pastes_on_user'
    add_index :pastes, :accessed_at, name=> 'index_pastes_on_accessed'
    add_index :pastes, :project_id, name=> 'index_pastes_on_project_id'
  end
end
