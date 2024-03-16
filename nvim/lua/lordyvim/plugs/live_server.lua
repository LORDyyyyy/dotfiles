require('live-server').setup({
    args = {
        '--port=9999',
        '--browser=' .. (os.getenv("BROWSER") or "firefox")
    }
})
