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
TrainingType.create(name: 'HIIT')

Equipment.create(name: 'Dumbbells')
Equipment.create(name: 'Medicine ball')
Equipment.create(name: 'Yoga Mat')
Equipment.create(name: 'Jump Rope')
Equipment.create(name: 'Yoga Ball')
Equipment.create(name: 'Resistance Bands')


# User 1:
Workout.create(
  name: "Strength Total Body",
  duration: 30,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/weight-lifting-1297690_960_720.png",
  views:350,
  category_id: 1,
  user_id:1 ,
  training_type_id: 1)

Workout.create(
  name: "Quick Pilates",
  duration: 5,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/6609676_orig.png",
  views: 500,
  category_id: 2,
  user_id:1 ,
  training_type_id: 2)

Workout.create(
  name: "Quick Cardio",
  duration: 10,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/logo-cardio.jpg",
  views: 500,
  category_id: 2,
  user_id:1 ,
  training_type_id: 3)

Workout.create(
  name: "Yoga",
  duration: 15,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/yoga-transparent.png",
  views: 50,
  category_id: 4,
  user_id:2 ,
  training_type_id: 4)

Workout.create(
  name: "Low Impact",
  duration: 20,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/lowimpact-logo.png",
  views: 50,
  category_id: 4,
  user_id:2 ,
  training_type_id: 5)

Workout.create(
  name: "Kickboxing Quickie",
  duration: 25,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/boxing-kickboxing-logo.png",
  views: 50,
  category_id: 3,
  user_id:2 ,
  training_type_id: 6)

Workout.create(
  name: "Total Body HIIT",
  duration: 30,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/HIIT-Logo.gif",
  views: 50 ,
  category_id: 3,
  user_id:3 ,
  training_type_id: 7)

#User 2
Workout.create(
  name: "Strength Upper Arms",
  duration: 35,
  difficulty: 2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/weight-lifting-1297690_960_720.png",
  views:350,
  category_id: 1,
  user_id:3 ,
  training_type_id: 1)

Workout.create(
  name: "Beginner Pilates",
  duration: 40,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/6609676_orig.png",
  views: 500,
  category_id: 2,
  user_id:3 ,
  training_type_id: 2)

Workout.create(
  name: "Cardio 30 Min",
  duration: 45,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/logo-cardio.jpg",
  views: 500,
  category_id: 2,
  user_id:1 ,
  training_type_id: 3)

Workout.create(
  name: "Morning Yoga",
  duration: 50,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/yoga-transparent.png",
  views: 50,
  category_id: 4,
  user_id:2 ,
  training_type_id: 4)

Workout.create(
  name: "Stretching",
  duration: 55,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/lowimpact-logo.png",
  views: 550,
  category_id: 3,
  user_id:3 ,
  training_type_id: 5)

Workout.create(
  name: "Kickboxing Total Body",
  duration: 30,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/boxing-kickboxing-logo.png",
  views: 600,
  category_id: 3,
  user_id:1 ,
  training_type_id: 6)

Workout.create(
  name: "HIIT Legs",
  duration: 35,
  difficulty:2 ,
  website:"https://www.fitnessblender.com/videos/low-impact-cardio-workout-for-beginners-feel-good-cardio",
  photo: "/images/HIIT-Logo.gif",
  views: 700,
  category_id: 1,
  user_id:2 ,
  training_type_id: 7)
