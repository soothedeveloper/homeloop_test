task :import_transactions, [:path] => [:environment] do |t, args|
  require 'csv'

  csv_content = File.read(args[:path])
  csv = CSV.parse(csv_content, :headers => true)

  csv.each do |row|
    Transaction.create!(row.to_hash)
  end
end
