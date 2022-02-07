ALTER TABLE questions DROP COLUMN rspn_category;
ALTER TABLE questions ADD COLUMN option_category optioncategory NOT NULL;
