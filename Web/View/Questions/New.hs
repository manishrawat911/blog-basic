module Web.View.Questions.New where
import Web.View.Prelude

data NewView = NewView { question :: Question, qcategories:: [QuestionCategory], ocategories:: [OptionCategory]}

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Question</h1>
        {renderForm question qcategories ocategories}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Questions" QuestionsAction
                , breadcrumbText "New Question"
                ]

renderForm :: Question -> [QuestionCategory] -> [OptionCategory] -> Html
renderForm question qcategories ocategories = formFor question [hsx|
    {selectField #category qcategories}
    <!-- {(textField #category)} -->
    {(textField #qstnDesc){fieldLabel = "Question Description"}}
    {(selectField #optionCategory ocategories)}
    <!-- {(textField #active)} -->
    {(checkboxField #active)}
    <!-- {myName} -->
    <!-- {(textField myName)} -->
    {submitButton}

|]
