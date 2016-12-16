module Main exposing (main)

{-| Module containing the entry point to the `bcd` program.

@docs main

-}

import Bcd
import Html exposing (Html)
import Html.Attributes as Html
import Html.Events as Html


{-| Main entry point.
-}
main : Program Never Model Msg
main =
  Html.program
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }


{-| Application state.
-}
type alias Model =
  { input : String }


{-| Initialize the application state.
-}
init : (Model, Cmd Msg)
init =
  ( Model "Self-sufficiency is the greatest of all wealth."  -- Epicurus.
  , Cmd.none
  )


{-| Messages handled by the application.
-}
type Msg
  = Change String


{-| Update the application state.
-}
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Change newContent ->
      ({model | input = newContent}, Cmd.none)


{-| Event sources that the application subscribes to.
-}
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


{-| View the application state as HTML.
-}
view : Model -> Html Msg
view model =
  Html.div
    [ Html.style
        [ ("align-items", "center")
        , ("display", "flex")
        , ("flex-direction", "column")
        , ("justify-content", "center")
        , ("margin-top", "5em")
        , ("top", "30%")
        ]
    ]
    [ Html.h1 [] [ Html.text "BCD" ]
    , Html.pre
        [ Html.style
            [ ("font-size", "1.5em")
            ]
        ]
        [ Html.text (Bcd.card model.input) ]
    , Html.input
        [ Html.type_ "text"
        , Html.placeholder "String to reformat as a punch card."
        , Html.autofocus True
        , Html.maxlength Bcd.columns
        , Html.onInput Change
        , Html.size Bcd.columns
        , Html.style
            [ ("font-family", "monospace")
            ]
        ]
        []
    ]
