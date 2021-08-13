# Rails 1 - Migrations

This section of the evaluation will be focused on assessing your knowledge on
writing ActiveRecord migrations. This portion of the evaluation is
estimated to take **15 minutes**.

**NB: Run `bundle install` before you get started.**

Next, set up the database:

    ./setup_db.sh

**If you run into a permissions issue, try running `chmod +x ./setup_db.sh`**

**IMPORTANT!!!!**
Run this script before writing any code or running any terminal commands besides
`bundle install`

If your `schema.rb` is emptied for any reason, copy over the contents of 
`schema copy.rb` into `schema.rb` and re-run the setup script. 

**Instructions**

Your task is to create the migrations to finish the schema for our application.
The database has been partially set up, but you'll need to edit some columns
on existing tables and create a new table for reviews.

## Assignment

`schema_goal.md` will be your main reference for correcting the database 
schema. The specs (`bundle exec rspec`) will also guide you to the needed 
changes. 

I would start by generating a migration to create the reviews table. Make sure
to run `bundle exec rails db:migrate` before running the specs. After creating 
the reviews table, generate another migration to make the appropriate changes
to the `users` and `restaurants` tables.

## Brief Description

Make sure to be looking at the specs and the `schema_goal.md`. Part of
your job is to be able to understand the desired structure of the database
from these resources. Use `shift + cmd + V` to display markdown files.

We provide a brief overview. A restaurant provides dishes to customers.
Customers can add dishes to their cart. Customers can write reviews 
of dishes from each restaurant.


**Copyright App Academy, please do not post online**