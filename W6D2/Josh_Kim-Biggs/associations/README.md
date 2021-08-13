We'll take **30min** for this part of the assessment.

**NB: Run `bundle install` before you get started.**

Next, set up the database:

    ./setup_db.sh

**If you run into a permissions issue, try running `chmod +x ./setup_db.sh`**

Your task today is to build the relationships between all of these
models. The database has already been setup and the models have been
annotated with their respective table schemas.

## Assignment

The specs (`bundle exec rspec`) will guide you through building a
series of associations. Refer to the `db/schema.rb` file to find the
format of the database; this will especially help you find the name of
foreign keys.

I would start by building `has_many`, `belongs_to` and `has_one`
associations. I would later build the `has_many :through`
associations.

## Brief Description

Make sure to be looking at the specs and the `db/schema.rb`. Part of
your job is to be able to understand the structure and interrelations
of the data from these sources.

We provide a brief overview. A restaurant provides dishes to customers.
Customers can add dishes to their cart. Customers can write reviews 
of dishes from each restaurant.
