require 'csv'
failed = 0
success = 0
csv_text = File.read Rails.root.join 'db', 'table.csv'
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  person = Person.create({
      name: row["name"],
      age: row["age"],
      gender: row["gender"],
      race: row["race"],
      image_url: row["image_url"],
      date: row["date"],
      street: row["street"],
      city: row["city"],
      state: row["state"],
      zip: row["zip"],
      county: row["county"],
      agency: row["agency"],
      cause: row["cause"],
      disposition: row["disposition"],
      charges: row["charges"],
      link_url: row["link_url"],
      mental_illness: row["mental_illness"],
      armed: row["armed"],
    })
  failed += 1 if person.nil?
  success += 1 unless person.nil?
end
puts "There are now #{Person.count} people. Failed: #{failed}. Success: #{success}"
