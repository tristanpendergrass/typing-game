module Game exposing (..)

import Browser
import Browser.Events
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


renderHealthBar : Html msg
renderHealthBar =
    div [ class "flex items-center" ]
        [ div [ class "w-40 h-4 bg-red-500" ]
            [ div [ class "w-[25%] h-4 bg-green-500" ] []
            ]
        ]


type alias PlayerMove =
    { shortcut : String
    , title : String
    }


playerMoves : List PlayerMove
playerMoves =
    [ { shortcut = "1", title = "Knight" }
    , { shortcut = "2", title = "Monk" }
    , { shortcut = "3", title = "Wizard" }
    ]


renderPlayerMove : PlayerMove -> Html msg
renderPlayerMove move =
    div [ class "flex items-center justify-center w-32 h-12 gap-2" ]
        [ kbd [ class "kbd kbd-xs" ] [ text move.shortcut ]
        , span [] [ text move.title ]
        ]


renderPlayerStuff : Model -> Html msg
renderPlayerStuff model =
    div [ class "flex flex-col items-center gap-4" ]
        [ h2 [] [ text "Player health" ]
        , renderHealthBar

        -- Move list
        , div [ class "flex flex-col items-center gap-2 w-64 min-h-[50px] bg-yellow-500" ]
            (List.map renderPlayerMove playerMoves)
        ]


renderMonsterStuff : Model -> Html msg
renderMonsterStuff model =
    div [ class "grid grid-cols-12 w-full h-full" ]
        []


renderTop : Model -> Html msg
renderTop model =
    div [ class "grid grid-cols-12 w-full h-full" ]
        [ div [ class "col-span-6 bg-blue-500 flex items-center justify-center" ] [ renderPlayerStuff model ]
        , div [ class "col-span-6 bg-red-500 flex items-center justify-center" ] [ renderMonsterStuff model ]
        ]


renderBottom : Model -> Html msg
renderBottom model =
    div [] []


render : Model -> Html msg
render model =
    div [ class "w-screen h-screen grid grid-rows-12" ]
        [ div [ class "row-span-6 bg-base-100" ]
            [ renderTop model ]
        , div [ class "row-span-6 bg-base-200" ] [ renderBottom model ]
        ]
