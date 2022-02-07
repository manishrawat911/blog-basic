module Web.View.Surveys.Show where
import Web.View.Prelude

data ShowView = ShowView { survey :: Survey }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Survey</h1>
        <p>{survey}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Surveys" SurveysAction
                            , breadcrumbText "Show Survey"
                            ]