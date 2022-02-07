module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Users
import Web.Controller.Questions
import Web.Controller.Surveys
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @UsersController
        , parseRoute @SurveysController
        , parseRoute @QuestionsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
