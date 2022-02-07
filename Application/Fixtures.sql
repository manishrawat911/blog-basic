

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


ALTER TABLE public.users DISABLE TRIGGER ALL;



ALTER TABLE public.users ENABLE TRIGGER ALL;


