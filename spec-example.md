# Specifications for the Rails Assessment

* When you create the rails app for your assessment, add this file to the root directory of the project, commit it to Git and push it up to GitHub.
* Make sure to check each box and explain next to each one how you've met the requirement *before* you submit your project.
* For en example of how a completed spec file might look, check out the [spec-example.md](spec-example.md).

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has_many Recipes) 
- [x] Include at least one belongs_to relationship (Post belongs_to User)
- [x] Include at least one has_many through relationship (Recipe has_many Items through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (ingredients.quantity)
- [x] Include reasonable validations for simple model objects (User, Recipe, Ingredient, Item)
- [x] Include a class level ActiveRecord scope method (User.most_recipes URL: /users/most_recipes)
- [x] Include a nested form writing to an associated model using a custom attribute writer (/recipe/new, Item)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (Devise/OmniAuth)
- [x] Include nested resource show or index (users/2/recipes)
- [x] Include nested resource "new" form (recipes/1/ingredients)
- [x] Include form display of validation errors (/recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
