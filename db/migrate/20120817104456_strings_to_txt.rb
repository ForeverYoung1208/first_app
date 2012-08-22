class StringsToTxt < ActiveRecord::Migration
  def up
    change_table :start_articles do |t|
      t.change (:content, :text)
    end
    change_table :services do |t|
      t.change (:name, :text)
      t.change (:description, :text)
      t.change (:price, :text)
    end
  end

  def down
  end
end
