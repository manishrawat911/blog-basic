ALTER TABLE survey_questions ADD CONSTRAINT survey_questions_ref_question_id FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE NO ACTION;
ALTER TABLE survey_questions ADD CONSTRAINT survey_questions_ref_survey_id FOREIGN KEY (survey_id) REFERENCES surveys (id) ON DELETE NO ACTION;
