module Web.View.Surveys.Show where
import Web.View.Prelude

data ShowView = ShowView { survey :: Survey,categories :: [QuestionCategory], questions :: [Question] }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Survey</h1>
        <p>{survey}</p>
        {renderForm survey categories questions}

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Surveys" SurveysAction
                            , breadcrumbText "Show Survey"
                            ]

renderForm :: Survey -> [QuestionCategory ] -> [Question] -> Html
renderForm survey categories questions= formFor survey [hsx|
    {(textField #surveyName)}
    {selectField #surveyCategory categories}
    {(checkboxField #active)}
    <!-- {(textField #surveyCategory)} -->
    {renderQuestions questions}
    {submitButton}

|]

renderQuestions :: [Question] -> Html
renderQuestions questions = [hsx| 
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>Select questions</th>
                <th></th>
            </tr>
        </thead>
        <tbody>{forEach questions renderQuestion}</tbody>
    </table>     
</div>
|]
    
renderQuestion:: Question -> Html
renderQuestion question = [hsx|
    <tr>
        <!-- <td><input type="checkbox" id="{get #id question}"></td> -->
        <!-- <td><input type="checkbox" value={get #id question}></td> -->
        
        <td><input type="checkbox" name="questionsL" value={inputValue (get #id question)} checked = {(get #active question)}></td>
        <!-- <td><input name="questions" type="checkbox" value={get #id question}></td> -->
        <td>{get #qstnDesc question}</td>
    </tr>
|]