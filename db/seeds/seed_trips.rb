@fake_trips = {
    destination: "Ventana Big Sur. 48123 CA-1, Big Sur, CA 93920",
    description: "Big Sur, California",
    start_date: "Sep 15, 2021",
    end_date: "Sep 23, 2021",
    meetup_time: "9:00",
    expected_end_time: "23:00",
    finished: false,
    user_id: jane.id
  },
  {
    destination: "Ventana Big Sur. 48123 CA-1, Big Sur, CA 93920",
    description: "Big Sur, California",
    start_date: "Sep 15, 2021",
    end_date: "Sep 23, 2021",
    meetup_time: "9:00",
    expected_end_time: "23:00",
    finished: false,
    user_id: jane.id
  },
  {
    destination: "Ventana Big Sur. 48123 CA-1, Big Sur, CA 93920",
    description: "Big Sur, California",
    start_date: "Sep 15, 2021",
    end_date: "Sep 23, 2021",
    meetup_time: "9:00",
    expected_end_time: "23:00",
    finished: false,
    user_id: jane.id
  }






def seed_trips
  @fake_trips.each do |fake_trip|
    checklist = Checklist.create!(trip_id: trip.id)



relevant_labels = []
Activity.first.recommended_item_labels.each do |rec|
  unless relevant_labels.include? rec.label
    relevant_labels << rec.label
    ChecklistItem.create(label: rec.label, checked: false, checklist: checklist)
  end
end


Tripactivity6 = TripActivity.create({trip_id: trip.id, activity_id: Activity.first.id})

invitation6 = Invitation.create([
  # TODO randomize from create users
  {trip_id: trip.id, user_id: ross.id},
  {trip_id: trip.id, user_id: rachel.id}
])


  end
end