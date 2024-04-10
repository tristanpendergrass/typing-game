module Main exposing (main)

import Browser
import Browser.Events
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }



-- MODEL


type alias Model =
    {}


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )



-- UPDATE


type Msg
    = NoOp
    | HandleAnimationFrameDelta Float


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        HandleAnimationFrameDelta delta ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Browser.Events.onAnimationFrameDelta HandleAnimationFrameDelta
        ]



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "p-16" ] [ text "Why hello there" ]
