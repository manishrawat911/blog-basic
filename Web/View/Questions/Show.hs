module Web.View.Questions.Show where
import Web.View.Prelude

data ShowView = ShowView { question :: Question }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
<td><b><label>Question Category: </label> </b> {get #category question}</td>
        <div><b><label>Question Description: </label> </b> {get #qstnDesc question}</div>
        <!-- <div><b><label>Option Category: </label> </b> {get #optCategory question}</div> -->
        <div><b><label>Response Category: </label> </b> {get #optionCategory question}</div>
        <div><b><label>Active: </label> </b> {get #active question}</div>
    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Questions" QuestionsAction
                            , breadcrumbText "Show Question"
                            ]