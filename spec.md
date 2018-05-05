# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
  Done!
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  Users has_many Guides.
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  Guides belong to Users and Games.
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  Users and Games are related to each other through Guides.
- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  Guides have a title and a body of text.
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  Validations are included for Username and password, as well as for game and guide titles.
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  A search for guide tool is used here.(Hope that fits)
- [X] Include signup (how e.g. Devise)
  Password digest and bcrypt is used.
- [X] Include login (how e.g. Devise)
  Uses sessions to keep track of users logged in.
- [X] Include logout (how e.g. Devise)
  Logs a user out by deleting session.
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
  OmniAuth used to login through GitHub
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
  Guides are nested within the game that they are for.
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  New guides are made through selecting that option within the particular game.
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
  All places where errors are present can been seen in the views.

Confirm:
- [x] The application is pretty DRY
  Hopefully this is the case. :)
- [X] Limited logic in controllers
  Helper methods are based in application controller.
- [X] Views use helper methods if appropriate
  Used to help confirm logins and current users.
- [X] Views use partials if appropriate
  Partials are used where forms are repeated.
