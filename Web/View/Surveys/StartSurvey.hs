module Web.View.Surveys.StartSurvey where

import Web.View.Prelude

data StartSurveyView = StartSurveyView {surveyId:: Id Survey, questions:: [Question], firstQuestion:: Question, options:: [Option], index:: Int}

instance View StartSurveyView where
    html StartSurveyView {..} = [hsx| 
    <!-- <h1>
        
        How are you feeling today?
    </h1> -->
    <!-- {renderSurveyDetails survey} -->
    <!-- {get #surveyName survey} -->
    <!-- {renderQuestions questions} -->
    <div class="container position-relative">
        <ul class="list-group">
                {renderQuestion firstQuestion}
        </ul>
    </div>

      |]    where
                    
                renderQuestion:: Question -> Html
                renderQuestion question = [hsx|
                    <h1 class="display-4 text-center">{get #qstnDesc question}</h1>

                    {renderOptions options}
            
                |]

                renderOptions:: [Option] -> Html
                renderOptions options = [hsx|
                    <ul>
                        {forEach options renderOption}
                    </ul>
                |]

                renderOption:: Option -> Html
                renderOption option = [hsx|
                    <li class="list-group-item">
                        <a class="btn btn-primary w-100 p-3" href={ SubmitResponseAction (surveyId) (get #id firstQuestion) (get #id option) index}>
                            <p class="h2">{get #optionDesc option}</p></a>
                    </li>
                        <!-- <button type="button" onclick= "{ UserSurveyAction }" class="btn btn-primary btn-lg">Large button</button> -->
                |]



-- renderSurveyDetails :: Survey -> Html
-- renderSurveyDetails survey = [hsx|
--     <!-- <h1>Hello there</h1> -->
--     <h1>{(get #surveyName survey)}</h1>
--     <!-- <a href={SubmitResponseAction (get #id survey)}>Click me!</a> -->

-- |]
