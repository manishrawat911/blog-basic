ALTER TABLE responses ADD CONSTRAINT responses_ref_option_id FOREIGN KEY (option_id) REFERENCES options (id) ON DELETE NO ACTION;
ALTER TABLE responses ADD CONSTRAINT responses_ref_question_id FOREIGN KEY (question_id) REFERENCES questions (id) ON DELETE NO ACTION;
ALTER TABLE responses ADD CONSTRAINT responses_ref_survey_id FOREIGN KEY (survey_id) REFERENCES surveys (id) ON DELETE NO ACTION;
