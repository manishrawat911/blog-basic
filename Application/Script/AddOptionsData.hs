#!/usr/bin/env run-script
module Application.Script.AddOptionsData where

import Application.Script.Prelude

import qualified Data.Text.IO as TIO
import qualified Data.Text as T

run :: Script
run = do
    options <- TIO.readFile "Options.txt"
    let lines = T.lines options

    -- let numberr = "45":: Int
    -- t: num?berr

    -- putStrLn (show lines)
    _ <- mapM (
        \ line -> do
            let words = T.words line
            let category = words !! 0
            let optionText = words !! 1
            let optionWeight = last words

            let listm = init words

            case listm of
                Just ls-> do
                    putStrLn (show ls)
                    listm <- tail ls
                    putStrLn (show listm)
                    case listm of
                        Just ls-> do
                            let tezt = transformToSentence ls
                                Just ts -> do putStrLn $ " " ++ ts
                                _-> do
                                    putStrLn "Nothing"
                    -- pure()

            -- case listm of
            --     Just ls-> do  
            --         let myOptionText = transformToSentence ls
            --         case myOptionText of
            --             Just elem-> do
            --                 putStrLn elem
            --                 pure()
            --         pure()
                    
                    -- putStrLn ($ " " ++ myOptionText)

            -- let myOptionText = transformToSentence (tail (init words))

            -- putStrLn category
            -- putStrLn optionText

            -- case optionWeight of
            --     Just weight -> do
            --         putStrLn weight
            
            -- putStrLn myOptionText

            -- let option = newRecord @Option

            -- existingUser <- query @User 
            --     |> findMaybeBy #category category
            --     |> findMaybeBy #optionDesc optionText


            -- case existingUser of
            --     Just _ -> do
            --         putStrLn $ optionText ++ " already existing, skipping..."
            --         return ()
            --     _ -> do
            --             putStrLn $ "Inserting " ++ optionText ++ "..."
            --             -- hashed <- hashPassword password
            --             user <- user
            --                 |> set #category category
            --                 |> set #optionText optionDesc
            --                 |> option
            --                 |> createRecord
            --             putStrLn $ "Inserted " ++ username

            --             group <- query @Group
            --                 |> findBy #name "everyone"

            --             newRecord @UserGroupRole
            --                 |> set #groupId (get #id group)
            --                 |> set #userId (get #id user)
            --                 |> set #userGroupRole Member
            --                 |> createRecord
            --             pure ()
            return ()
        ) lines

    putStrLn "Hello World!"
    return ()


transformToSentence :: [Text] -> Text

transformToSentence [] = do ""

transformToSentence wordList = do
    (wordList !! 0) ++ " " ++ transformToSentence (drop 1 wordList)
    -- ++ " " ++ transformToSentence (drop 1 wordList)
