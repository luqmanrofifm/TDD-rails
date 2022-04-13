class ChangePriceDatatypeToFloat < ActiveRecord::Migration[7.0]
    def up
        change_column :foods, :price, :float
    end

    def down
        change_column :foods, :price, :integer
    end
end
