return {
    "rusagaib/oas-preview.nvim",
    event = { "BufEnter *.yml", "BufEnter *.yaml" },
    opts = {
        api_route = "http://127.0.0.1",
        port = "1337",
        ui = "swagger",
    },
}
