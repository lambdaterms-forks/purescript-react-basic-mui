{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "mui-codegen"
, dependencies =
    [ "console"
    , "debug"
    , "effect"
    , "node-fs-aff"
    , "psci-support"
    , "read-dts"
    , "simple-json"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
