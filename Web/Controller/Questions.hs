module Web.Controller.Questions where

import Web.Controller.Prelude
import Web.View.Questions.Index
import Web.View.Questions.New
import Web.View.Questions.Edit
import Web.View.Questions.Show
import Web.View.Questions.New
import Web.View.Questions.Edit (EditView(question))

instance Controller QuestionsController where
    action QuestionsAction = do
        questions <- query @Question |> fetch
        render IndexView { .. }

    action NewQuestionAction = do
        let question = newRecord
        do 
            -- let myName = "Manish"
            let qcategories = allEnumValues @QuestionCategory
            let ocategories = allEnumValues @OptionCategory 
            render NewView { .. }

        -- qcategories = allEnumValues @QuestionCategory

    action ShowQuestionAction { questionId } = do
        question <- fetch questionId
        render ShowView { .. }

    action EditQuestionAction { questionId } = do
        question <- fetch questionId
        do
            let categories = allEnumValues @QuestionCategory
            let ocategories = allEnumValues @OptionCategory
            render EditView { .. }

    action UpdateQuestionAction { questionId } = do
        question <- fetch questionId
        question
            |> buildQuestion
            |> ifValid \case
                Left question -> do
                    let categories = allEnumValues @QuestionCategory 
                    let ocategories = allEnumValues @OptionCategory
                    render EditView { .. }
                Right question -> do
                    question <- question |> updateRecord
                    setSuccessMessage "Question updated"
                    redirectTo EditQuestionAction { .. }

    action CreateQuestionAction = do
        let question = newRecord @Question
        question
            |> buildQuestion
            |> ifValid \case
                Left question -> do
                    let qcategories = allEnumValues @QuestionCategory  
                    let ocategories = allEnumValues @OptionCategory
                    render NewView { .. } 
                Right question -> do
                    question <- question |> createRecord
                    setSuccessMessage "Question created"
                    redirectTo QuestionsAction

    action DeleteQuestionAction { questionId } = do
        question <- fetch questionId
        deleteRecord question
        setSuccessMessage "Question deleted"
        redirectTo QuestionsAction

buildQuestion question = question
    |> fill @["category","qstnDesc","optionCategory","active"]
