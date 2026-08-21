```sh
tailscale status
python3 -m http.server 999
```

# only allow html access:
```python
from http.server import SimpleHTTPRequestHandler, HTTPServer
import sys

class HTMLOnlyHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        # 允许根目录请求（默认会找index.html）
        # 只允许.html/.htm后缀的文件请求
        if self.path != '/' and not self.path.endswith(('.html', '.htm')):
            self.send_error(403, "仅允许访问HTML文件")
            return
        # 走默认逻辑返回文件内容/查找index.html
        super().do_GET()

    # 禁用目录列表功能，避免暴露非HTML文件
    def list_directory(self, path):
        self.send_error(403, "仅允许访问HTML文件")
        return None

if __name__ == '__main__':
    # 默认端口999，支持命令行手动指定端口
    default_port = 999
    if len(sys.argv) > 1:
        try:
            port = int(sys.argv[1])
        except ValueError:
            print("❌ 端口必须是数字！示例：python3 server.py 8080")
            sys.exit(1)
    else:
        port = default_port

    # 启动服务
    try:
        server = HTTPServer(('0.0.0.0', port), HTMLOnlyHandler)
        print(f"✅ HTML-only服务器启动成功")
        print(f"📍 监听端口：{port}")
        print(f"🌐 本地访问：http://localhost:{port}")
        print(f"📱 Tailscale访问：http://100.123.235.7:{port} 或 http://macbook-air-four:{port}")
        print("⏹️ 停止服务请按 Ctrl+C")
        server.serve_forever()
    except OSError as e:
        if e.errno == 48:
            print(f"❌ 端口{port}已被占用，请换一个端口试试，比如：python3 server.py 8081")
        else:
            print(f"❌ 启动失败：{e}")
        sys.exit(1)
```