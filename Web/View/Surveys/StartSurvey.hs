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
    {renderQuestion firstQuestion}
    
    <div class="btn-group btn-group-toggle" data-toggle="buttons">
        <label class="btn btn-secondary active">
            <input type="radio" name="options" id="option1" autocomplete="off" checked> Not Well
        </label>
        <label class="btn btn-secondary">
            <input type="radio" name="options" id="option2" autocomplete="off"> Good
        </label>
        <label class="btn btn-secondary">
            <input type="radio" name="options" id="option3" autocomplete="off"> Never Better!
        </label>
    </div>
      |]    where
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
                        
                        <!-- <td><input type="checkbox" name="questionsL" value={inputValue (get #id question)}></td> -->
                        <!-- <td><input name="questions" type="checkbox" value={get #id question}></td> -->
                        <td>{get #qstnDesc question}</td>
                        {renderOptions options}
                    </tr>
                |]

                renderOptions:: [Option] -> Html
                renderOptions options = [hsx|
                    <ul>
                        {forEach options renderOption}
                    </ul>
                |]

                renderOption:: Option -> Html
                renderOption option = [hsx|
                    <li>
                        <a href={ SubmitResponseAction (surveyId) (get #id firstQuestion) (get #id option) index}>{get #optionDesc option}</a>
                    </li>
                |]



-- renderSurveyDetails :: Survey -> Html
-- renderSurveyDetails survey = [hsx|
--     <!-- <h1>Hello there</h1> -->
--     <h1>{(get #surveyName survey)}</h1>
--     <!-- <a href={SubmitResponseAction (get #id survey)}>Click me!</a> -->

-- |]
