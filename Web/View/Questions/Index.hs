module Web.View.Questions.Index where
import Web.View.Prelude

data IndexView = IndexView { questions :: [ Question ] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewQuestionAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Question</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach questions renderQuestion}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Questions" QuestionsAction
                ]

renderQuestion :: Question -> Html
renderQuestion question = [hsx|
    <tr>
        <td>{get #category question}</td>
        <td>{get #qstnDesc question}</td>
        <!-- <td>{get #optCategory question}</td> -->
        <td>{get #optionCategory question}</td>
        <td>{get #active question}</td>
        <td><a href={ShowQuestionAction (get #id question)}>Show</a></td>
        <td><a href={EditQuestionAction (get #id question)} class="text-muted">Edit</a></td>
        <td><a href={DeleteQuestionAction (get #id question)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]