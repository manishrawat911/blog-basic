module Web.View.Surveys.StartSurvey where

import Web.View.Prelude

data StartSurveyView = StartSurveyView { survey :: Survey}

instance View StartSurveyView where
    html StartSurveyView {..} = [hsx| 
    <!-- <h1>
        
        How are you feeling today?
    </h1> -->
    {renderSurveyDetails survey}
    <!-- {get #surveyName currentSurvey} -->
    
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
      |]

renderSurveyDetails :: Survey -> Html
renderSurveyDetails survey = [hsx|
    <!-- <h1>Hello there</h1> -->
    <h1>{(get #surveyName survey)}</h1>
    <!-- <a href={SubmitResponseAction (get #id survey)}>Click me!</a> -->

|]