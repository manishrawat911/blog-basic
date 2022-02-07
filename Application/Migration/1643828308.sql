ALTER TABLE survey_questions DROP COLUMN survey_id;
ALTER TABLE survey_questions DROP COLUMN question_id;
ALTER TABLE survey_questions ADD COLUMN survey_id TEXT NOT NULL;
ALTER TABLE survey_questions ADD COLUMN question_id TEXT NOT NULL;
DROP INDEX survey_questions_question_id_index;
DROP INDEX survey_questions_survey_id_index;
ALTER TABLE survey_questions DROP CONSTRAINT survey_questions_ref_question_id;
ALTER TABLE survey_questions DROP CONSTRAINT survey_questions_ref_survey_id;
