CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    username TEXT NOT NULL,
    user_group TEXT NOT NULL,
    user_role TEXT NOT NULL
);
