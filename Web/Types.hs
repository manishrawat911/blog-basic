module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.MailPrelude (CanSelect (selectValue, selectLabel), SelectValue)

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data QuestionsController
    = QuestionsAction
    | NewQuestionAction
    | ShowQuestionAction { questionId :: !(Id Question) }
    | CreateQuestionAction
    | EditQuestionAction { questionId :: !(Id Question) }
    | UpdateQuestionAction { questionId :: !(Id Question) }
    | DeleteQuestionAction { questionId :: !(Id Question) }
    deriving (Eq, Show, Data)

-- Custom code starts here
instance CanSelect QuestionCategory where
    type SelectValue QuestionCategory = QuestionCategory
    selectValue value = value

    selectLabel Endurability = "Endurability"
    selectLabel PerceivedUsability = "Perceived Usability"
    selectLabel AestheticAppeal = "Aesthetic Appeal"
    selectLabel Novelty = "Novelty"
    selectLabel FeltInvolement = "Felt Involement"
    selectLabel FocusedAttention = "Focused Attention"
    selectLabel Confidence = "Confidence"
    selectLabel SocialAwareness = "Social Awareness"
    selectLabel SocialRegulation = "Social Regulation"
    selectLabel CodingConfidence = "Coding Confidence"
    selectLabel SelfEfficacy = "Self Efficacy"
    selectLabel EmotionalRegulation = "Emotional Regulation"
    selectLabel GrowthMindset = "GrowthMindset"
    selectLabel Marketing = "Marketing"



data SurveysController
    = SurveysAction
    | NewSurveyAction
    | ShowSurveyAction { surveyId :: !(Id Survey) }
    | CreateSurveyAction
    | EditSurveyAction { surveyId :: !(Id Survey) }
    | UpdateSurveyAction { surveyId :: !(Id Survey) }
    | DeleteSurveyAction { surveyId :: !(Id Survey) }
    | StartSurveyAction { surveyId :: !(Id Survey) }    
    | UserSurveyAction
    -- | SubmitResponseAction { surveyId :: !(Id Survey)}
    deriving (Eq, Show, Data)

data UsersController
    = UsersAction
    | NewUserAction
    | ShowUserAction { userId :: !(Id User) }
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    | DeleteUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)


instance CanSelect OptionCategory where
    type SelectValue OptionCategory = OptionCategory
    selectValue value = value

    selectLabel Cat1 = "CAT 1"
    selectLabel Cat2 = "CAT 2"
    selectLabel Cat3 = "CAT 3"
    selectLabel Cat4 = "CAT 4"
    selectLabel Cat5 = "CAT 5"
    selectLabel Cat6 = "CAT 6"
    selectLabel Cat7 = "CAT 7"
    selectLabel Cat8 = "CAT 8"