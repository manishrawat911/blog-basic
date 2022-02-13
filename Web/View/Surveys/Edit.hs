module Web.View.Surveys.Edit where
import Web.View.Prelude

data EditView = EditView { survey :: Survey, categories :: [QuestionCategory] }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Survey</h1>
        {renderForm survey categories}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Surveys" SurveysAction
                , breadcrumbText "Edit Survey"
                ]

renderForm :: Survey -> [QuestionCategory ] -> Html
renderForm survey categories = formFor survey [hsx|
    {(textField #surveyName)}
    {selectField #surveyCategory categories}
    <!-- {(textField #surveyCategory)} -->
    {(checkboxField #active)}
    {submitButton}

|]