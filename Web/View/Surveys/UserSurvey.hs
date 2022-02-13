module Web.View.Surveys.UserSurvey where
import Web.View.Prelude

data UserSurveyView = UserSurveyView { surveys :: [ Survey ]  }

instance View UserSurveyView where
    html UserSurveyView { .. } = [hsx|
        {breadcrumb}
        <h1>Surveys you can take</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Survey</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>{forEach surveys renderSurvey}</tbody>
            </table>
            
        </div>
        |]
            where
                breadcrumb = renderBreadcrumb
                                [ breadcrumbLink "UserSurveys" SurveysAction
                                , breadcrumbText "UserSurveyView"
                                ]

renderSurvey :: Survey -> Html
renderSurvey survey = [hsx|
    <tr>
        <!-- <td><input type="checkbox" id={putStrLn (get #id survey)}></td> -->
        <!-- <td>{checkboxField #survey}</td> -->
        <!-- <td><input type="checkbox" value={get #id survey}></td> -->
        <!-- <td><input type="checkbox" value={inputValue (get #id survey)}></td> -->
        <td>{get #surveyName survey}</td>
        <td>{get #surveyCategory survey}</td>
        <!-- <td>{survey}</td> -->
        <!-- <td>{inputValue (get #id survey)}</td> -->
        <td><a href={BuildSurveyAction (get #id survey) } >Start Survey</a></td>
    </tr>
|]