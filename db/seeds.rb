# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(name: 'ElleAdmin', email: "elleadmin@gmail.com", password: "test", admin: true)
vol_1 = User.create(name: "Volunteer 1", email: "vol_1@gmail.com", password: 'test')
vol_2 = User.create(name: "Volunteer 2", email: "vol_2@gmail.com", password: 'test')
time_slot_1 = TimeSlot.create(start_time: "2019-08-11 10:00:00", duration: 60, number_of_volunteers_needed: 5)
#YYYY-MM-DD HH:MM:SS.SSS
time_slot_2 = TimeSlot.create(start_time: "2019-08-12 10:00:00", duration: 120, number_of_volunteers_needed: 3)
time_slot_3 = TimeSlot.create(start_time: "2019 -08-13 10:00:00", duration: 180, number_of_volunteers_needed: 3)

user_time_slot_1 = UserTimeSlot.create(user_id: 1, time_slot_id: 2)
user_time_slot_2 = UserTimeSlot.create(user_id: 2, time_slot_id: 2)
user_time_slot_3 = UserTimeSlot.create(user_id: 3, time_slot_id: 2)
