User.create(email: "hello123@gmail.com", password: "please123")
User.create(email: "goodbye123@gmail.com", password: "please123")
User.create(email: "happy123@gmail.com", password: "please123")


Category.create(name: 'Upper Body')
Category.create(name: 'Lower Body')
Category.create(name: 'Total Body')
Category.create(name: 'Abs')

TrainingType.create(name: 'Strength Training')
TrainingType.create(name: 'Pilates')
TrainingType.create(name: 'Cardio')
TrainingType.create(name: 'Yoga')
TrainingType.create(name: 'Low Impact')
TrainingType.create(name: 'Kickboxing')

Equipment.create(name: 'Dumbbells')
Equipment.create(name: 'Medicine ball')
Equipment.create(name: 'Yoga Mat')
Equipment.create(name: 'Jump Rope')
Equipment.create(name: 'Yoga Ball')
Equipment.create(name: 'Resistance Bands')




  Workout.create(user_id:1 ,
    name: "Low Impact Cardio",
    duration: 30,
    difficulty:2 ,
    category_id: 1,
    training_type_id: 2,
    website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio" )
