module Web.View.Surveys.Index where
import Web.View.Prelude
import Data.UUID (UUID, toText)

data IndexView = IndexView { surveys :: [ Survey ]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewSurveyAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Survey</th>
                        <th>Category</th>
                        <th>Is Active?</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>{forEach surveys renderSurvey}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Surveys" SurveysAction
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
        <td>{get #active survey}</td>
        <!-- <td>{inputValue (get #id survey)}</td> -->
        <td><a href={ShowSurveyAction (get #id survey)}>Show</a></td>
        <td><a href={EditSurveyAction (get #id survey)} class="text-muted">Edit</a></td>
        <td><a href={DeleteSurveyAction (get #id survey)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]