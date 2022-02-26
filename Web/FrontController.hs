module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Sessions
import Web.Controller.Users
import Web.Controller.Questions
import Web.Controller.Surveys
import Web.Controller.Static
-- Sessions imports
import IHP.LoginSupport.Middleware

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @SessionsController
        , parseRoute @UsersController
        , parseRoute @SurveysController
        , parseRoute @QuestionsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User