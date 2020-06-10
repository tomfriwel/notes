# Tornado

### Get request IP address

```python
class someHandler(web.RequestHandler):
	async def prepare(self):
    # some codes
	
	async def get(self):
		requestIp = self.request.headers.get('X-Real-Ip')
```