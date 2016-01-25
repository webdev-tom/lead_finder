require 'csv'


User.create(
  first_name: "Test",
  last_name: "User",
  email: "user@gmail.com",
  password: "password",
  )


#Seeding DB with CSV of Leads
datafile = Rails.root.to_s + "/app/assets/leads.csv".encode('UTF-8')
file = CSV.open(datafile, "r:UTF-8")

CSV.foreach(file.path, headers: true) do |row|

  Lead.find_or_create_by(
    company_id: row[0],
    company_name: row[1],
    phys_address: row[2],
    phys_city: row[3],
    phys_state: row[4],
    phys_zip: row[5],
    phys_county: row[6],
    mail_address: row[7],
    mail_city: row[8],
    mail_state: row[9],
    mail_zip: row[10],
    phone: row[11],
    alt_phone: row[12],
    toll_free_phone: row[13],
    fax_phone: row[14],
    website: row[15],
    email: row[16],
    employees_on_site: row[17],
    annual_sales: row[18],
    year_est: row[19],
    area_of_dist: row[20],
    ownership: row[21],
    imports: row[22],
    woman_owned: row[23],
    minority_owned: row[24],
    description: row[25]
  )

end
