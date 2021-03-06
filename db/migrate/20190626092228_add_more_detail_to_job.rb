class AddMoreDetailToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :wage_upper_bound, :integer
    add_column :jobs, :wage_lower_bound, :integer
    add_column :jobs, :contact_email, :string
    add_column :jobs, :company, :string
    add_column :jobs, :city, :string
  end
end
