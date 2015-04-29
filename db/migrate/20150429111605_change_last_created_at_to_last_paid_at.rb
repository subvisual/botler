class ChangeLastCreatedAtToLastPaidAt < ActiveRecord::Migration
  def change
    remove_column :periodic_expenses, :last_created_at, :date
    add_column :periodic_expenses, :last_paid_at, :date
  end
end
