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
        let categories = allEnumValues @QuestionCategory
        surveyquestionsList <- query @SurveyQuestion |> filterWhere (#surveyId , surveyId)|> fetch 

        -- let allQuestions:: 

        let ys = map mapToUUID surveyquestionsList
        -- putStrLn (show ys)  

        questions <- fetch ys
        render ShowView { .. }

    action EditSurveyAction { surveyId } = do
        survey <- fetch surveyId
        do
            let categories = allEnumValues @QuestionCategory
            -- Work here
            surveyquestionsList <- query @SurveyQuestion |> filterWhere (#surveyId , surveyId)|> fetch -- |> select #questionId
            -- putStrLn "Hello"
            -- let sizeQ = length surveyquestions
            -- putStrLn (show sizeQ)
            -- putStrLn (inputValue (get #id (surveyquestions !! 0)))

            let ys = map mapToUUID surveyquestionsList
            putStrLn (show ys)  

            survey_questions <- fetch ys

            putStrLn (show survey_questions)
            
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
    
    action BuildSurveyAction { surveyId , index} = do 
        -- fetch questionids for 
        survey <- fetch surveyId
        -- questionsForsurvey <- query @SurveyQuestion |> filterWhere (#surveyId, surveyId) |> fetch
        -- let questionIds:: [Id Question] = map mapToUUID questionsForsurvey
        
        -- -- let questions = fetch questionIds
        -- do
        --     -- questions:: [Question] <- sqlQuery "SELECT * FROM questions WHERE id IN ?" (Only (In questionIds))
        --     questions:: [Question] <- fetch questionIds
        --     let firstQuestion:: Question = questions !! 0

        --     -- do
        --     --     let fQuestion = questions !! 0
        --     --     case fQuestion of
        --     --         Just Question-> do   
        --     --             firstQuestion <- fQuestion 
        --     --             render StartSurveyView{..}
        --     -- render StartSurveyView{..}
        --     -- let index = 0
        survey
            |> buildSurvey
            |> ifValid \case
                Left survey -> do 
                    -- let categories = allEnumValues @QuestionCategory
                    -- render EditView { .. }
                    putStrLn "some error occured"
                Right survey -> do
                    let starting_index = index
                    redirectTo StartSurveyAction { surveyId = surveyId, index = starting_index}
        -- call StartSurveyAction ( surveyid, questionslist, nextQuestion, index)
        -- questions:: [Question], survey :: Survey, question:: Question, options:: [Option]
        


    action StartSurveyAction { surveyId, index } = do
        -- survyeId, questionList, questionId, userid, 
        -- fetch questions for given survey id
        -- pass theses question to view
        -- if head of questionList isn't empty
        -- render head of the questions list
        --
        -- survey <- fetch surveyId
        -- surveyquestionsList <- query @SurveyQuestion |> filterWhere (#surveyId , surveyId)|> fetch -- |> select #questionId
        -- let ys = map mapToUUID surveyquestionsList
        -- questions <- fetch ys
        -- let firstQuestion = questions !! 0
        -- let index = 0
        --  <- 
        survey <- fetch surveyId
        questionsForsurvey <- query @SurveyQuestion |> filterWhere (#surveyId, surveyId) |> fetch
        let questionIds:: [Id Question] = map mapToUUID questionsForsurvey
        let length_of_questions = length questionIds
        putStrLn ("Lenght of question is " <> show length_of_questions)
        if (length questionIds) <= index
            then
                redirectTo UserSurveyAction 
        else
        -- let questions = fetch questionIds
            do
                questions:: [Question] <- fetch questionIds
                let firstQuestion:: Question = questions !! index
                options:: [Option] <- query @Option |> filterWhere (#category, get #optionCategory firstQuestion) |> fetch
                putStrLn (show options)
            -- questions:: [Question] <- sqlQuery "SELECT * FROM questions WHERE id IN ?" (Only (In questionIds))
                render StartSurveyView{..}
            -- render StartSurveyView{}

    action SubmitResponseAction { surveyId, questionId, optionId, index } = do
        surveyQuestionResponse <- newRecord @Response
            |> set #surveyId (surveyId)
            |> set #questionId (questionId)
            |> set #optionId (optionId)
            |> createRecord
        
        index <- return (index + 1)
        putStrLn ("Next index would be " <> show index)
        -- redirectTo StartSurveyAction{..}
        redirectToPath ((pathTo StartSurveyAction { .. }))
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

-- getSurveyQuestionIds :: SurveyQuestion -> Maybe [Id Question]

-- getSurveyQuestionIds [] = putStrLn "Noting"

-- getSurveyQuestionIds surveyQuestion = do
--     (get #questionId surveyQuestion) +

mapToUUID :: SurveyQuestion -> Id Question

mapToUUID sq = do
    get #questionId sq

fetchOptionsForQuestion::(?modelContext :: ModelContext) => Question -> IO [Option]
fetchOptionsForQuestion question = do
    query @Option |> filterWhere (#category, get #optionCategory question)|> fetch

fetchQuestionsForIds::(?modelContext :: ModelContext) => [Id Question] -> IO [Question]
fetchQuestionsForIds ids = do
    fetch ids