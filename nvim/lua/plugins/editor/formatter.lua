local options = {}

options.config = function()
    require("formatter").setup(
        {
            filetype = {
                lua = {
                    function()
                        -- https://www.npmjs.com/package/lua-fmt
                        return {
                            exe = "luafmt",
                            args = {"--indent-count", 4, "--stdin"},
                            stdin = true
                        }
                    end
                },
                terraform = {
                    function()
                        return {
                            exe = "terraform",
                            args = {"fmt", "-"},
                            stdin = true
                        }
                    end
                },
                python = {
                    function()
                        return {
                            exe = "python -m autopep8",
                            args = {
                                "--in-place --aggressive --aggressive",
                                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                            },
                            stdin = false
                        }
                    end
                }
            }
        }
    )
end

return options
