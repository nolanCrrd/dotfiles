return {
    "danymat/neogen",
    config = function()
        require("neogen").setup({
            languages = {
                c = {
                    template = {
                        annotation_convention = "doxygen"
                    }
                }
            }
        })
    end,
    version = "*"
}
