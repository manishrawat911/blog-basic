ALTER TABLE responses DROP COLUMN response_desc;
ALTER TABLE responses ADD COLUMN question_id UUID NOT NULL;
