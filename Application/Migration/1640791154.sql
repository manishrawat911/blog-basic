CREATE TABLE responses (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    response_category responsecategory NOT NULL,
    response_desc TEXT NOT NULL,
    response_weight INT NOT NULL,
    response_seq INT NOT NULL
);
