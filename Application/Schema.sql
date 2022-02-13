-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE QuestionCategory AS ENUM ('Endurability', 'Perceived_Usability', 'Aesthetic_Appeal', 'Novelty', 'Felt_Involement', 'Focused_Attention', 'Confidence', 'Social_Awareness', 'Social_Regulation', 'Coding_Confidence', 'Self_Efficacy', 'Emotional_Regulation', 'Growth_Mindset', 'Marketing');
CREATE TYPE ResponseCategory AS ENUM ('five_options_positive_up', 'five_options_negative_up');
CREATE TYPE OptionCategory AS ENUM ('CAT_1', 'CAT_2', 'CAT_3', 'CAT_4', 'CAT_5', 'CAT_6', 'CAT_7', 'CAT_8');
CREATE TABLE questions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    category QuestionCategory NOT NULL,
    qstn_desc TEXT NOT NULL,
    option_category OptionCategory NOT NULL,
    active BOOLEAN DEFAULT false NOT NULL
);
CREATE TABLE responses (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    survey_id UUID NOT NULL,
    question_id UUID NOT NULL,
    option_id UUID NOT NULL
);
CREATE TABLE surveys (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    survey_name TEXT NOT NULL,
    survey_category QuestionCategory NOT NULL,
    active BOOLEAN DEFAULT false NOT NULL
);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    username TEXT NOT NULL,
    user_group TEXT NOT NULL,
    user_role TEXT NOT NULL
);
CREATE TABLE options (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    category OptionCategory NOT NULL,
    option_desc TEXT NOT NULL,
    option_weight INT NOT NULL,
    option_seq INT NOT NULL,
    active BOOLEAN DEFAULT true NOT NULL
);
CREATE TABLE survey_questions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    survey_id UUID NOT NULL,
    question_id UUID NOT NULL
);
ALTER TABLE responses ADD CONSTRAINT responses_ref_option_id FOREIGN KEY (option_id) REFERENCES options (id) ON DELETE NO ACTION;
ALTER TABLE responses ADD CONSTRAINT responses_ref_question_id FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE NO ACTION;
ALTER TABLE responses ADD CONSTRAINT responses_ref_survey_id FOREIGN KEY (survey_id) REFERENCES surveys (id) ON DELETE NO ACTION;
ALTER TABLE survey_questions ADD CONSTRAINT survey_questions_ref_question_id FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE NO ACTION;
ALTER TABLE survey_questions ADD CONSTRAINT survey_questions_ref_survey_id FOREIGN KEY (survey_id) REFERENCES surveys (id) ON DELETE NO ACTION;
