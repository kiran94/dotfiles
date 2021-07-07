require('telescope').setup{
  prompt_position = "bottom",
  defaults = {
          file_ignore_patterns = {
                  ".env/",
                  ".venv/",
                  ".git/",
                  ".terraform/",
                  "node_modules/",
                  "bin/",
                  "obj/"
          }
  }
}

