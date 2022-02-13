

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.options DISABLE TRIGGER ALL;



ALTER TABLE public.options ENABLE TRIGGER ALL;


ALTER TABLE public.questions DISABLE TRIGGER ALL;

INSERT INTO public.questions (id, category, qstn_desc, option_category, active) VALUES ('7c5b4fec-2883-4ae9-a574-9dd33abc11ec', 'Felt_Involement', 'How likely are you to recommend this activity to a friend?', 'CAT_1', true);
INSERT INTO public.questions (id, category, qstn_desc, option_category, active) VALUES ('7ab2a112-9604-4a18-b840-7dd71bf99083', 'Felt_Involement', 'All team members, including me, contributed meaningfully.', 'CAT_2', true);
INSERT INTO public.questions (category, qstn_desc, option_category, active) VALUES ('Felt_Involement', 'Would friends in your class like to create a <Mystery game> together in the same way?', 'CAT_5', true);



ALTER TABLE public.questions ENABLE TRIGGER ALL;


ALTER TABLE public.responses DISABLE TRIGGER ALL;



ALTER TABLE public.responses ENABLE TRIGGER ALL;


ALTER TABLE public.schema_migrations DISABLE TRIGGER ALL;

INSERT INTO public.schema_migrations (revision) VALUES (1643872251);
INSERT INTO public.schema_migrations (revision) VALUES (1643872458);


ALTER TABLE public.schema_migrations ENABLE TRIGGER ALL;


ALTER TABLE public.surveys DISABLE TRIGGER ALL;

INSERT INTO public.surveys (id, survey_name, survey_category, active) VALUES ('679abf01-1a73-4a18-a1b3-88efa5ee6f9d', 'Involment Survey', 'Endurability', true);


ALTER TABLE public.surveys ENABLE TRIGGER ALL;


ALTER TABLE public.survey_questions DISABLE TRIGGER ALL;

INSERT INTO public.survey_questions (id, survey_id, question_id) VALUES ('92e6bb8b-f1cb-4b2a-81af-bc35de2f3e1b', '679abf01-1a73-4a18-a1b3-88efa5ee6f9d', '7c5b4fec-2883-4ae9-a574-9dd33abc11ec');
INSERT INTO public.survey_questions (id, survey_id, question_id) VALUES ('cf6f2f15-f79b-4989-8493-42f7a247a9f1', '679abf01-1a73-4a18-a1b3-88efa5ee6f9d', '7ab2a112-9604-4a18-b840-7dd71bf99083');




ALTER TABLE public.survey_questions ENABLE TRIGGER ALL;

INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_1', 'From school.',  1 , 1);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_1', 'From a friend.',  1 , 2);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_1', 'From Social Media.',  1 , 3);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_1', 'From parents',  1 , 4);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_1', 'Internet search',  1 , 5);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_1', 'Other',  1 , 6);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_2', 'It''s fun!',  1 , 1);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_2', 'I want to something new.',  1 , 2);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_2', 'I want to make a game.',  1 , 3);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_2', 'I want to ge a coder.',  1 , 4);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_2', 'As a friend activity.',  1 , 5);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_2', 'I''m trapped in a dungeon.',  1 , 6);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_3', 'Definitely.',  1 , 1);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_3', 'Probably.',  1 , 2);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_3', 'Maybe',  1 , 3);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_3', 'Probably not.',  1 , 4);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_3', 'Definitely not.',  1 , 5);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_4', 'Always.',  1 , 1);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_4', 'Usually.',  1 , 2);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_4', 'Sometimes.',  1 , 3);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_4', 'Rarely.',  1 , 4);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_4', 'Never.',  1 , 5);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_5', 'Always.',  1 , 1);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_5', 'Usually.',  1 , 2);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_5', 'Sometimes.',  1 , 3);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_5', 'Rarely.',  1 , 4);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_5', 'Never.',  1 , 5);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_6', 'Being creative.',  1 , 1);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_6', 'Making friends.',  1 , 2);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_6', 'Learning a new skill.',  1 , 3);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_6', 'Being challenged.',  1 , 4);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_6', 'Other/I don''t know',  1 , 5);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_7', 'Too fast',  1 , 1);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_7', 'Fast',  1 , 2);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_7', 'Just right',  1 , 3);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_7', 'Slow',  1 , 4);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_7', 'Too slow',  1 , 5);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_8', 'Exactly',  1 , 1);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_8', 'Mostly',  1 , 2);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_8', 'Somewhat',  1 , 3);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_8', 'A little',  1 , 4);
INSERT INTO public.options (category, option_desc, option_weight, option_seq) VALUES ('CAT_8', 'I was surprised! ',  1 , 5);


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


