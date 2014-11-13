class AddPulseIdToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :pulse_id, :integer
  end
end
