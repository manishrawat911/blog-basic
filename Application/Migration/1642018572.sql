CREATE TABLE survey_questions (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    survey_id UUID NOT NULL,
    question_id UUID NOT NULL
);
CREATE INDEX survey_questions_survey_id_index ON survey_questions (survey_id);
CREATE INDEX survey_questions_question_id_index ON survey_questions (question_id);
ALTER TABLE survey_questions ADD CONSTRAINT survey_questions_ref_question_id FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE NO ACTION;
ALTER TABLE survey_questions ADD CONSTRAINT survey_questions_ref_survey_id FOREIGN KEY (survey_id) REFERENCES surveys (id) ON DELETE NO ACTION;
