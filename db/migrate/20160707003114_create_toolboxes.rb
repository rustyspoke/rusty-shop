class CreateToolboxes < ActiveRecord::Migration
  def change
    create_table :toolboxes do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    add_belongs_to :visits, :toolbox
  end
end
