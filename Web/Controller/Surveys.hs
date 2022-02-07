module Web.Controller.Surveys where

import Web.Controller.Prelude
import Web.View.Surveys.Index
import Web.View.Surveys.New
import Web.View.Surveys.Edit
import Web.View.Surveys.Show
import Web.View.Surveys.StartSurvey
import Web.View.Surveys.UserSurvey

instance Controller SurveysController where
    action SurveysAction = do
        surveys <- query @Survey |> fetch
        render IndexView { .. }

    action UserSurveyAction = do
        surveys <- query @Survey |> filterWhere (#active, True)|> fetch
        render UserSurveyView { .. }

    action NewSurveyAction = do
        let survey = newRecord
        do
            let categories = allEnumValues @QuestionCategory
            questions <- query @Question |> filterWhere (#active, True) |> fetch
            render NewView { .. }

    action ShowSurveyAction { surveyId } = do
        survey <- fetch surveyId
        render ShowView { .. }

    action EditSurveyAction { surveyId } = do
        survey <- fetch surveyId
        do
            let categories = allEnumValues @QuestionCategory
            -- Work here
            surveyquestions <- query @SurveyQuestion |> filterWhere (#surveyId , surveyId)|> fetch 
            -- questionIds <- map (get #questionId) surveyquestions
            -- questions <- query @Question |> filterWhereIn (#id, get #id surveyquestions)
            render EditView { .. }

    action UpdateSurveyAction { surveyId } = do
        survey <- fetch surveyId
        survey
            |> buildSurvey
            |> ifValid \case
                Left survey -> do 
                    let categories = allEnumValues @QuestionCategory
                    render EditView { .. }
                Right survey -> do
                    survey <- survey |> updateRecord
                    setSuccessMessage "Survey updated"
                    let categories = allEnumValues @QuestionCategory
                    redirectTo EditSurveyAction { .. }

    action CreateSurveyAction = do
        let survey = newRecord @Survey
        let questionsList = paramList @Text "questionsL"
        putStrLn (questionsList !! 0)
        survey
            |> buildSurvey
            |> ifValid \case
                Left survey -> do
                    let categories = allEnumValues @QuestionCategory
                    questions <- query @Question |> fetch
                    render NewView { .. } 
                Right survey -> do
                    -- create a new record in filter table
                    survey <- survey |> createRecord
                    do
                        -- get id of survey record and fetch the list of the question ids from request parameters
                        -- pass this survey id and question id list to another function "setQuestionForSurvey"
                        -- "setQuestionForSurvey" will recursively add records in survey_questions table with survey id and question id
                        setQuestionForSurvey questionsList (inputValue (get #id survey))
                        -- let surveyQuestion = newRecord @SurveyQuestion
                        -- surveyQuestion <- 
                        setSuccessMessage "Survey created"
                        redirectTo SurveysAction

    action DeleteSurveyAction { surveyId } = do
        survey <- fetch surveyId
        deleteRecord survey
        setSuccessMessage "Survey deleted"
        redirectTo SurveysAction
    
    -- action BuildSurveyAction { surveyId } = do 
    --     -- fetch questionids for 
    -- list of questions
    -- call StartSurveyAction ( surveyid, questionslist, nextQuestion, index)
    -- 

    action StartSurveyAction { surveyId } = do
        -- survyeId, questionList, questionId, userid, 
        -- fetch questions for given survey id
        -- pass theses question to view
        -- if head of questionList isn't empty
        -- render head of the questions list
        --
        survey <- fetch surveyId
        render StartSurveyView{ .. }

    -- action SubmitResponseAction { surveyId } = do
    --     putStrLn "Response Submitted"
    --     r

buildSurvey survey = survey
    |> fill @["surveyName","surveyCategory","active"]
 

setQuestionForSurvey :: (?modelContext :: ModelContext)=> [Text] -> Text -> IO()

setQuestionForSurvey [] stringsss = do
    putStrLn "Array is empty"


-- Simply print list and uuid of survey
setQuestionForSurvey questionsList surveyid = do
    surveyQuestion <- newRecord @SurveyQuestion
            |> set #surveyId (textToId surveyid)
            |> set #questionId (textToId (questionsList !! 0))
            |> createRecord
    setQuestionForSurvey (drop 1 questionsList) surveyid
    putStrLn (show questionsList)
    putStrLn (inputValue surveyid)

-- setQuestionForSurvey questionsList surveyId = do
--     case surveyId of
--         Just surveyIdJ -> putStrLn ("" ++ (head questionsList) ++ " " ++ Just surveyIdJ)
--         Nothing -> putStrLn "Nothing"
-- setQuestionForSurvey [] surveyId = return Nothing

-- setQuestionForSurvey questionsList surveyId = do
--     case surveyId  of
--         Just surveyId -> putStrLn ("" ++ surveyId)
--     putStrLn (""+ surveyId)

-- setQuestionForSurvey [] survey = do 
--     putStrLn ("Nothing")

-- setQuestionForSurvey questionsArray surveyId = do 
--     let surveyQuestionEntry = newRecord @SurveyQuestion

--     surveyQuestion <- 
--     | set (questionId,  head questionsArray)
--     | set (surveyId, surveyId)
--     | createRecord

--     setQuestionForSurvey 

getSurveyQuestionIds :: SurveyQuestion -> Maybe [Id Question]

getSurveyQuestionIds [] = Nothing

-- getSurveyQuestionIds surveyQuestion = do
--     (get #questionId surveyQuestion) +