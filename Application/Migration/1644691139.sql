ALTER TABLE responses DROP COLUMN response_category;
ALTER TABLE responses ADD COLUMN survey_id UUID NOT NULL;
