CREATE TABLE IF NOT EXISTS restaurants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS pizzas (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    cheese VARCHAR(50),
    dough VARCHAR(50),
    secret_ingredient VARCHAR(100),
    restaurant_id INT REFERENCES restaurants(id)
);

CREATE TABLE IF NOT EXISTS ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);

CREATE TABLE IF NOT EXISTS pizza_ingredients (
    pizza_id INT REFERENCES pizzas(id) ON DELETE CASCADE,
    ingredient_id INT REFERENCES ingredients(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS chefs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    restaurant_id INT REFERENCES restaurants(id)
);

CREATE TABLE IF NOT EXISTS reviews (
    id SERIAL PRIMARY KEY,
    restaurant_id INT REFERENCES restaurants(id),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    text VARCHAR(500)
);

INSERT INTO ingredients (name) VALUES ('Томаты'), ('Моцарелла'), ('Пепперони'), ('Грибы') ON CONFLICT DO NOTHING;