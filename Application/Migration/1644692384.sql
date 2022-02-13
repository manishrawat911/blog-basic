ALTER TABLE responses DROP COLUMN response_weight;
ALTER TABLE responses DROP COLUMN response_seq;
ALTER TABLE responses ADD COLUMN option_id UUID NOT NULL;
