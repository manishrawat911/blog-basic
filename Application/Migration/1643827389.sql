CREATE TABLE options (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    category optioncategory NOT NULL
);
