Sys.setenv(TERM_PROGRAM = "vscode")
source(file.path(
    Sys.getenv(
        if (.Platform$OS.type == "mac") "USERPROFILE" else "HOME"
    ),
    ".vscode-R",
    "init.R"
))
btw::btw_mcp_session()
