# Build a Rails App

## Overview

In this lesson you're going to build a complete Ruby on Rails application that manages related data through complex forms and RESTful routes. The goal of the application is to build a Content Management System, whether the content being managed is Blog Posts, Recipes, a Library of Resources, or any domain model that lends itself to these requirements (the majority of ideas you could come up with would probably meet the requirements).

## Requirements

1. Use the Ruby on Rails framework.

2. Your models must include a `has_many`, a `belongs_to`, and a `has_many :through` relationship. You can include more models to fill out your domain, but there must be at least a model acting as a join table for the has_many through. Also, make sure that the join table contains at least one user submittable attribute; for example: rides with tickets or appointments with times.

3. Your models should include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

4. You must include at least one class level ActiveRecord scope methods. To some extent these class scopes can be added to power a specific individual feature, such as "My Overdue Tasks" in a TODO application, scoping all tasks for the user by a datetime scope for overdue items, `@user.tasks.overdue`. Reports make for a good usage of class scopes, such as "Most Valuable Cart by Customer" where the code would implement a `Cart.most_valuable` and `Cart.by_customer` which could be combined as `Cart.most_valuable.by_customer(@customer)`.

5. Your application must provide a standard user authentication, including signup, login, logout, and passwords. You can use [Devise](https://github.com/plataformatec/devise) but given the complexity of that system, you should also feel free to roll your own authentication logic.

6. Your authentication system should allow login from some other service. Facebook, twitter, foursquare, github, etc...

7. You must make use of a nested resource with the appropriate RESTful URLs. Additionally, your nested resource must provide a form that relates to the parent resource. Imagine an application with user profiles. You might represent a person's profile via the RESTful URL of /profiles/1, where 1 is the primary key of the profile. If the person wanted to add pictures to their profile, you could represent that as a nested resource of /profiles/1/pictures, listing all pictures belonging to profile 1. The route `/profiles/1/pictures/new` would allow me to upload a new picture to profile 1. Focus on making a working application first and then adding more complexity. Making a nested URL resource like '/divisions/:id/teams/new' is great. Having a complex nested resource like 'countries/:id/sports/:id/divisions/:id/teams/new' is going to make this much harder on you.

8. Your forms should correctly display validation errors. Your fields should be enclosed within a fields_with_errors class and error messages describing the validation failures must be present within the view.

9. Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. Logic present in your controllers should be encapsulated as methods in your models. Your views should use helper methods and partials to be as logic-less as possible. Follow patterns in the [Rails Style Guide](https://github.com/bbatsov/rails-style-guide) and the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).

10. **Do not** use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding. That’s why we do not allow the use of scaffolding for projects.

### Example Domains

- A Recipe Manager - Should provide the ability to browse recipes by different filters such as date created, ingredient count, rating, comments, whatever your domain provides. Additionally ingredients would need to be unique so that the first user that adds Chicken to their recipe would create the canonical (or atomic/unique/individual) instance of Chicken (the only row to ever have the name Chicken in the ingredients table). This will force a join model between ingredients and recipes and provide an easy way to group recipes by ingredients, which would be a great view to implement. Associating some user-centric data regarding recipes such as ratings or comments would further fill out the domain and provide some great learning experiences.

- A Group Task Manager - An application that allowed the creation of task lists with individual tasks that can be assigned to a user would flex the majority of the requirements of this assessment. You would be able to create a list of tasks, add tasks to that list, and assign those tasks to a user.

lists
users
tasks
  user_id
  list_id
  status
  due_date
tags
task_tags
tag_id task_id

### Restricted Domains

- A Blog App - We used a Blog domain design for a lot of the rails lessons and code-alongs.

- An Amusement Park - This is the domain design for one of the final Rails projects. Try to find inspiration from this project and build something unique and different.


## Instructions

1. Create a new repository on GitHub for your Rails application.
2. When you create the Rails app for your assessment, add the spec.md file from this repo to the root directory of the project, commit it to Git and push it up to GitHub.
3. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable. **This is important and you'll be graded on this**.
4. Record at least a 30 min coding session. During the session, either think out loud or not. It's up to you. You don't need to submit it, but we may ask for it at a later time.
5. Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement *before* you submit your project.
6. Write a README.md.
7. [Fill out this checklist.](https://docs.google.com/forms/d/1QlU2-UQNSjlv2Tf2yP8oDsduMobK_1w0ZFXaTpywMCk/)
7. Submit a video of how a user would interact with your working web application.
8. Write a blog post about the project and process.
9. When done, submit your GitHub repo's url, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up.

## If you're a Learn-Verified Premium student:

Unlike the rest of the curriculum, if you have any questions about your assessment or need help with it, please don’t use the Ask New Question feature. Rather than working with Learn Experts, please reach out to your Learn Instructor responsible for this section instead.

We should reach out to you soon to schedule a review. If you don't hear from us in 48 hours after submission, reach out to us on Slack!

### Be Prepared to:

1. Explain your code from execution point to exit point. We're making sure you wrote it and understand how it works, nothing else. 5-10 minutes
2. Write tests together. You'll be responsible for making tests pass, not writing test code. However, you'll be expected to provide expected return data of methods. You'll need to know how your code should work, not rspec or testing. 20-30 minutes
3. Refactor code. 20-30 minutes
4. Extend the application with a new feature, more data, a different domain etc. 20-30 minutes
5. Submit an improved version.

### What to expect from the instructor review

Project reviews are focused on preparing you for technical interviews. Treat project reviews as if they were technical interviews, in both attitude and technical presentation. Starting with this project, your instructor will deliberately give you a more challenging project review, to give you a better sense of the kind of experience and pressure that you experience during a real technical interview. Believe it or not, almost all technical interviewers really do want you to succeed, and we'll work with you as many times as necessary to get you through the review if you don't nail it the first time (which is quite common and completely OK). However, we will potentially give you a hard time, cut you off, push you on your use of vocabulary and/or your coding choices. We want to try to give you a sense of what a coding interview might be like, so you build the confidence to describe your app and to write code even in a higher pressure, slightly more adversarial environment.

#### Be scrappy.
- If you make a mistake, correct yourself.
- Think on your feet. We will expect you to be able to explain development concepts to us, as well as expanding on concepts that you have already implemented, but you’ll also have the opportunity to look things up while you're live coding.

#### Make no little plans.
- Approach live coding with a constructive attitude. You might feel nervous or uncertain, but as long as you are familiar with the section material you should be able to reason your way to a solution.
- Be proud of your project and your code, and show confidence in it.

#### Radiate positivity.
- Present yourself and your project in the best way possible.
- Be open to feedback, both positive and constructive. We give feedback to help each other get better.
- If the instructor asks you to complete additional features, or you missed a project requirement, treat this as a learning experience. Becoming a developer is complex and challenging, and it’s our job to find the holes in your knowledge and help you fill them. This is to help you become a better developer, not to delay your progress in the program.

#### Work Together.
- Our goal is to give you the most thorough technical interview possible in the time allocated. This will include live coding where the instructor might give you one or two pointers, but will for the most part sit back and watch you code.
- Ask clarification questions when you need them. Asking for more details is always ok.

#### Pursue mastery.
- Use the best technical vocabulary you can. You will be expected to present yourself as a competent Rails developer.
- Explain the details - this is your application, you should have a very thorough understanding of how each piece works.
- Curiosity and willingness to learn are hugely valued in our industry. If there are things you don’t understand, then ask questions at the end of the review for more information. Your instructor will be able to point you to the appropriate section lead or technical coach for more information.
- Pretend you’re interviewing for a job as a Rails developer. We’re looking for competent, passionate people who are excited to learn, build, and grow. You won’t be expected to be an expert, but people who will be good to work with.


<p class='util--hide'>View <a href='https://learn.co/lessons/rails-assessment'>Rails Portfolio Project</a> on Learn.co and start learning to code for free.</p>
