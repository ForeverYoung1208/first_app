class CreateStartArticles < ActiveRecord::Migration
  def change
    create_table :start_articles do |t|
      t.string :content

      t.timestamps
    end
  end
end
