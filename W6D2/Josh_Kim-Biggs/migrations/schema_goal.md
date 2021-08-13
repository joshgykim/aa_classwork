## `users`
| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `username`         | string    | not null, indexed, unique      |
| `password`         | string    | not null                       |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |
 
## `restaurants` 
| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `name`             | string    | not null                       |
| `address`          | string    | not null                       |
| `owner_id`         | integer   | indexed                        |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |
 
## `dishes`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `name`             | string    | not null                       | 
| `description`      | text      | not null                       | 
| `restaurant_id`    | integer   | not null, indexed              |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `reviews`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `body`             | text      | not null                       |
| `rating`           | integer   | not null                       |
| `user_id`          | integer   | not null, indexed              |
| `restaurant_id`    | integer   | not null, indexed              |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `carts`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `user_id`          | integer   | not null, indexed, unique      |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

## `cart_items`

| column name        | data type | details                        |
|:-------------------|:---------:|:-------------------------------|
| `id`               | integer   | not null, primary key          |
| `cart_id`          | integer   | not null, indexed              |
| `dish_id`          | integer   | not null, indexed              |
| `created_at`       | datetime  | not null                       |
| `updated_at`       | datetime  | not null                       |

