-- 17.18 Relationships & Schema Design
-- To run these commands:
-- \i /Users/jaekim/projects/node/knex-practice/sql-scripts/suppliers.sql

DROP TABLE IF EXISTS supplier_order;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS supplier;

-- supplier table
CREATE TABLE supplier (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    supplier_name TEXT NOT NULL,
    phone TEXT,
    city TEXT
);

-- item table
CREATE TABLE item(
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    item_name TEXT NOT NULL,
    unit TEXT,
    unit_cost numeric,
    -- removed // supplier INTEGER REFERENCES supplier(id) NOT NULL
    supplier INTEGER REFERENCES supplier(id) ON DELETE SET NULL
);

-- supplier_order table
CREATE TABLE supplier_order (
    id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    order_date DATE DEFAULT now(),
    -- removed // item INTEGER REFERENCES item(id) NOT NULL,
    item INTEGER REFERENCES item(id) ON DELETE CASCADE NOT NULL,
    amount numeric,
    total_cost numeric,
    shipping_status TEXT
);
