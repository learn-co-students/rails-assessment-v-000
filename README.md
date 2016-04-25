# Build a Rails App

## Overview

In this lesson you're going to build a complete Ruby on Rails application that manages related data through complex forms and RESTful routes. The goal of the application is to build a Content Management System, whether the content being managed is Blog Posts, Recipes, a Library of Resources, or any domain model that lends itself to these requirements (the majority of ideas you could come up with would probably meet the requirements).

## Requirements

1. Use the Ruby on Rails framework.

2. Your models must include a `has_many`, a `belongs_to`, and a `has_many :through` relationship. You can include more models to fill out your domain, but there must be at least a model acting as a join table for the has_many through.

3. The join model must also store an additional attribute describing the relationship. For example, in a blog domain with comments by users, you'd have a posts table and a users table, with the comments table containing the foreign key for the `post_id` and the `user_id` along with the comment's content. In a TODO list application with shareable lists, you'd have a lists table and users table and then a `user_lists` table giving users access to lists via columns `user_id` and `list_id`, but you'd want to add a permission column to `user_lists` that described how a user relates to the list, whether they could edit it or just view it or delete it, etc.

4. Your models should include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

5. You must include at least one class level ActiveRecord scope methods. To some extent these class scopes can be added to power a specific individual feature, such as "My Overdue Tasks" in a TODO application, scoping all tasks for the user by a datetime scope for overdue items, `@user.tasks.overdue`. Reports make for a good usage of class scopes, such as "Most Valuable Cart by Customer" where the code would implement a `Cart.most_valuable` and `Cart.by_customer` which could be combined as `Cart.most_valuable.by_customer(@customer)`.

6. You must include a nested form that writes to an associated model through a custom attribute writer. An example of this would be a New Recipe form that allowed you to add ingredients that are unique across recipes (thereby requiring a join model, or imagine being able to see all recipes that include Chicken), along with a quantity or description of the ingredient in the recipe. On this form you would have a series of fields named `recipe[ingredient_attributes][0][name]` and `recipe[ingredient_attributes][0][description]` which would write to the recipe model through a method `ingredient_attributes=`. This method cannot be provided via the `accepts_nested_attributes_for` macro because the custom writer would be responsible for finding or creating a recipe by name and then creating the row in the join model `recipe_ingredients` with the `recipe_id`, the `ingredient_id`, and the description from the form.

7. Your application must provide a standard user authentication, including signup, login, logout, and passwords. You can use [Devise](https://github.com/plataformatec/devise) but given the complexity of that system, you should also feel free to roll your own authentication logic. 

8. Your authentication system should allow login from some other service. Facebook, twitter, foursquare, github, etc...

9. You must make use of a nested resource with the appropriate RESTful URLs. Additionally, your nested resource must provide a form that relates to the parent resource. Imagine an application with user profiles. You might represent a person's profile via the RESTful URL of /profiles/1, where 1 is the primary key of the profile. If the person wanted to add pictures to their profile, you could represent that as a nested resource of /profiles/1/pictures, listing all pictures belonging to profile 1. The route `/profiles/1/pictures/new` would allow to me upload a new picture to profile 1.

10. Your forms should correctly display validation errors. Your fields should be enclosed within a fields_with_errors class and error messages describing the validation failures must be present within the view.

11. Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app. Logic present in your controllers should be encapsulated as methods in your models. Your views should use helper methods and partials to be as logic-less as possible. Follow patterns in the [Rails Style Guide](https://github.com/bbatsov/rails-style-guide) and the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).


### Example Domains

- A Recipe Manager - Should provide the ability to browse recipes by different filters such as date created, ingredient count, rating, comments, whatever your domain provides. Additionally ingredients would need to be unique so that the first user that adds Chicken to their recipe would create the canonical (or atomic/unique/individual) instance of Chicken (the only row to ever have the name Chicken in the ingredients table). This will force a join model between ingredients and recipes and provide an easy way to group recipes by ingredients, which would be a great view to implement. Associating some user-centric data regarding recipes such as ratings or comments would further fill out the domain and provide some great learning experiences.

- A Group Task Manager - An application that allowed the creation of task lists with individual tasks that can be assigned to a user would flex the majority of the requirements of this assessment. You would be able to create a list of tasks, add tasks to that list, and assign those task to a user.

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


## Instructions

1. Create a new repository on github for your app
2. Submit that repo to the assessment immediately.
3. Build your app there. Make sure to commit early and commit often.
4. Record at least a 30 min coding session. During the session, either think out loud or not. It's up to you. You don't need to submit it, but we may ask for it at a later time.
5. Submit a video of how a user would interact with your working web application.
6. Submit the url to your github project
7. Write a blog post about the project and process.


## If you're a Learn-Verified Premium student:

We should reach out to you soon to schedule a pairing process. If you don't hear from us in 48 hours after submission, reach out to us on Slack!

### Be Prepared to:

1. Explain your code from execution point to exit point. We're making sure you wrote it and understand how it works, nothing else. 5-10 minutes
2. Write tests together. You'll be responsible for making tests pass, not writing test code. However, you'll be expected to provide expected return data of methods. You'll need to know how your code should work, not rspec or testing. 20-30 minutes
3. Refactor code. 20-30 minutes
4. Extend the application with a new feature, more data, a different domain etc. 20-30 minutes
5. Submit an improved version.
6. Write a README.md.

### What to expect from the pairing session

- Use the best vocabulary you can. Technical terms allow for you to be more precise which makes conversations about code much easier.
- If you make a mistake, correct yourself! We all make mistakes, I promise.
- Trust yourself
- Trust us
- Think on your feet. Feel free to look things up while you're pairing with us. You'll be asked to expand on concepts you implemented and you will be pushed to the edge of your knowledge.
- Explain the details. We're curious!
- You're going to learn a ton. We will give pointers and show you ways to improve your code. This isn't telling you that your code is wrong, it's simply us teaching. Whatever you don't quite understand will be explained

### What won't happen:

- You won't be told you're ever wrong
- You won't be yelled at, belittled, or scolded
- You won't be put on the spot without support
- There's nothing you can do to instantly fail or blow it.


<p class='util--hide'>View <a href='https://learn.co/lessons/rails-assessment'>Rails Assessment</a> on Learn.co and start learning to code for free.</p>
