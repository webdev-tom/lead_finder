class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :company_id, null: false
      t.string :company_name, null: false
      t.string :phys_address, null: false
      t.string :phys_city, null: false
      t.string :phys_state, null: false
      t.string :phys_zip, null: false
      t.string :phys_county
      t.string :mail_address
      t.string :mail_city
      t.string :mail_state
      t.string :mail_zip
      t.string :phone
      t.string :alt_phone
      t.string :toll_free_phone
      t.string :fax_phone
      t.string :website
      t.string :email
      t.integer :employees_on_site, null: false
      t.string :annual_sales
      t.integer :year_est
      t.string :area_of_dist
      t.string :ownership
      t.boolean :imports
      t.boolean :woman_owned
      t.boolean :minority_owned
      t.text :description
      t.boolean :status, default: true
      t.integer :user_id, default: 0
    end
  end
end
