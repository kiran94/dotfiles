return {
	"ahmedkhalf/project.nvim",
	event = "BufWinEnter",
    config = function()
        require("project_nvim").setup()
    end,

}
