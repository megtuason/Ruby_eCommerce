# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Type.destroy_all
Admin.create(email:"admin@gmail.com", password: "admin")

ActiveStorage::Blob.all.each { |attachment| attachment.purge }
ActiveStorage::Attachment.all.each { |attachment| attachment.purge }
ActiveRecord::Base.connection.execute('ALTER TABLE types AUTO_INCREMENT = 1')