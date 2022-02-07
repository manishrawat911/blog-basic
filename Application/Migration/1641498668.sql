CREATE TABLE surveys (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    survey_name TEXT NOT NULL,
    survey_category questioncategory NOT NULL
);
