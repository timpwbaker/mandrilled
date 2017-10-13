# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def emails
  ["alex@lostmy.name",
   "barney@lostmy.name",
   "callum@lostmy.name",
   "f@lostmy.name",
   "jacob@lostmy.name",
   "jesse@lostmy.name",
   "josh@lostmy.name",
   "oz@lostmy.name",
   "patrick@lostmy.name",
   "pete@lostmy.name",
   "rehat@lostmy.name",
   "simon@lostmy.name",
   "simonf@lostmy.name",
   "tal@lostmy.name",
   "tom@lostmy.name",
   "tony@lostmy.name",
   "vitor@lostmy.name"]
end

def timestamp
  now = DateTime.current
  now - Random.rand(100000).seconds
end

def email_type
  ["Order",
   "UserConfirmation",
   "Shipment",
   "ReferAFriend",
   "GetABookDiscount"]
end


def event
  n = Random.rand(100)
  case n
  when 1..60
    "send"
  when 61..90
    "open"
  when 91..100
    "click"
  end
end

Random.rand(1000..3000).times do
  Event.create(address: emails.shuffle.first,
               email_type: email_type.shuffle.first,
               event: event,
               timestamp: timestamp)
end
