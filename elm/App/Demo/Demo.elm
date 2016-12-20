module App.Demo.Demo exposing
  ( init, update, urlUpdate, view, subscriptions
  , Model, Msg
  )

{-| The main demo component. Handles the demo section routing.
-}

import Html exposing (Html, section, h1, p, text)
import App.Demo.DemoRoute exposing (Route(..))

type Model = Model
  { routeModel: Route
  }

type Msg =
  Noop

init : Route -> (Model, Cmd Msg)
init route =
  ( Model
      { routeModel = route
      }
  , Cmd.none
  )

update : Msg -> Model -> (Model, Cmd Msg)
update msg (Model model) =
  ( Model model, Cmd.none )

urlUpdate : Route -> Model -> (Model, Cmd Msg)
urlUpdate route (Model model) =
  ( Model { model | routeModel = route }
  , Cmd.none
  )

view : Model -> Html Msg
view (Model model) =
  case model.routeModel of
    DemoRoute ->
      section []
        [ h1 [] [ text "Demo Overview" ]
        , p [] [ text "An overview of all demo pages will go here." ]
        ]
    AccordionDemoRoute ->
      section []
        [ h1 [] [ text "Accordion Demo" ]
        , p [] [ text "An accordion component demo will go here." ]
        ]
    CheckboxDemoRoute ->
      section []
        [ h1 [] [ text "Checkbox Demo" ]
        , p [] [ text "A checkbox demo will go here." ]
        ]
    OtherDemoRoute ->
      section []
        [ h1 [] [ text "Other Demo" ]
        , p [] [ text "Some other demo will go here." ]
        ]

subscriptions : Model -> Sub Msg
subscriptions (Model model) =
  Sub.none
