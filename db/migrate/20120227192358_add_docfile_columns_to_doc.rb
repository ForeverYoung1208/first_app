class AddDocfileColumnsToDoc < ActiveRecord::Migration
  def change
    add_column :docs, :docfile_file_name,    :string
    add_column :docs, :docfile_content_type, :string
    add_column :docs, :docfile_file_size,    :integer
    add_column :docs, :docfile_updated_at,   :datetime 
  end
end
