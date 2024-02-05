c.NotebookApp.port = 8080
c.NotebookApp.ip = '0.0.0.0' # listen on all IPs
c.NotebookApp.token = ''
c.NotebookApp.password = ''
c.NotebookApp.allow_origin = '*' #allow all origins
c.NotebookApp.notebook_dir = '/usercode'
c.NotebookApp.webbrowser_open_new = False
c.NotebookApp.disable_check_xsrf = True
c.NotebookApp.tornado_settings = {
    'headers': {
        'Content-Security-Policy': "frame-ancestors https://*.appspot.com https://*.educative.io 'self' ;",
    }
}