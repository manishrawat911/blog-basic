ALTER TABLE options DROP COLUMN option_seq;
ALTER TABLE options ADD COLUMN option_seq INT NOT NULL;
