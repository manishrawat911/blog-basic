ALTER TABLE options ADD COLUMN option_seq TEXT NOT NULL;
ALTER TABLE options ADD COLUMN active BOOLEAN DEFAULT true NOT NULL;
