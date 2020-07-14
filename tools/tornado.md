# Tornado

### Get request IP address

```python
class someHandler(web.RequestHandler):
	async def prepare(self):
    # some codes
	
	async def get(self):
		requestIp = self.request.headers.get('X-Real-Ip')
```

### Customize 404 handler

```python
from tornado import web
class My404Handler(web.RequestHandler):
    # Override prepare() instead of get() to cover all possible HTTP methods.
    def prepare(self):
        self.set_status(404)
        self.render("404.html")

app = Application(..., default_handler_class=My404Handler)
```

[Tornado Error Handling](https://stackoverflow.com/questions/30939298/tornado-error-handling)