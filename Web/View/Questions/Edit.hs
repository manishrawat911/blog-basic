module Web.View.Questions.Edit where
import Web.View.Prelude

data EditView = EditView { question :: Question, categories :: [QuestionCategory ] }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Question</h1>
        {renderForm question categories}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Questions" QuestionsAction
                , breadcrumbText "Edit Question"
                ]

renderForm :: Question -> [QuestionCategory ] -> Html
renderForm question categories = formFor question [hsx|
    <!-- {(textField #category)} -->
    {selectField #category categories}
    {(textField #qstnDesc)}
    {(textField #optionCategory)}
    {(checkboxField #active)}
    {submitButton}

|]