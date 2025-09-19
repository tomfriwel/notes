# ​​个人分布式小算力集群 (Personal Distributed Micro-Computing Cluster)

py-distributed-cluster​​

由个人组建的微型计算节点网络，通过分布式架构整合低功耗设备（如树莓派/旧手机）形成协同计算能力


太好了！你手上有 **一台 Mac + 一部 iPhone + 一部安卓设备**，这是搭建 **个人分布式小算力集群** 的绝佳组合！我们来用 **1分钟极速方案**，让你马上让这三台设备联动起来，实现一个**“主控发任务 → 多设备领任务计算 → 返回结果”**的完整流程。

---

## 🎯 1分钟极速目标：

> 用你的 **Mac 当主控（发任务、收结果）**，**iPhone 和安卓设备当打工人（Worker，领任务做计算）**，三台设备组个小团队，**通过 Wi-Fi 联网，用 Python 快速跑一个分布式任务系统**。

---

## ✅ 极简方案：Python + HTTP（主从模式，局域网互联）

- **Mac** → 运行 **主控服务（Master）**，负责分发任务、收结果  
- **iPhone 和安卓** → 运行 **Worker（打工人）**，负责领任务、计算、回传结果  
- **通信方式** → **HTTP（局域网内，同一 Wi-Fi 下即可）**  
- **编程语言** → **Python（Mac 原生支持，iPhone/安卓用 Termux 或 Pyto 等工具）**

---

## 🧩 一、角色分配（简单清晰）

| 设备     | 角色     | 要做什么                          |
|----------|----------|-----------------------------------|
| **Mac**  | 主控节点 | 运行 `master.py`，分发任务，接收结果 |
| **iPhone** | Worker | 运行 `worker.py`，领任务、计算、回传 |
| **安卓** | Worker | 运行 `worker.py`，领任务、计算、回传 |

---

## 🛠️ 二、代码准备（直接复制，无需安装复杂环境）

### 1️⃣ 主控代码（Mac 上运行 → `master.py`）

> 只需运行一次，它会监听任务请求，把任务分发给 iPhone 和安卓设备。

```python
# master.py —— 在 Mac 上运行
from flask import Flask, request, jsonify

app = Flask(__name__)

# 模拟任务列表（可换成真实任务，比如图片、文本、计算等）
tasks = [
    {"id": 1, "data": "任务1：Mac请你算 1+1"},
    {"id": 2, "data": "任务2：Mac请你算 2+2"},
    {"id": 3, "data": "任务3：Mac请你算 3+3"},
]

current = 0

@app.route('/get_task', methods=['GET'])
def get_task():
    global current
    if current < len(tasks):
        task = tasks[current]
        current += 1
        return jsonify({"task": task})
    else:
        return jsonify({"task": None})  # 没任务啦

@app.route('/submit_result', methods=['POST'])
def submit_result():
    data = request.json
    print(f"✅ 收到来自 Worker 的结果：任务{data['task_id']} => {data['result']}")
    return jsonify({"status": "ok"})

if __name__ == '__main__':
    import socket
    hostname = socket.gethostname()
    ip = socket.gethostbyname(hostname)
    print(f"🚀 Mac 主控已启动！请在 iPhone 和安卓设备访问：http://{ip}:5000/get_task")
    app.run(host='0.0.0.0', port=5000)
```

---

### 2️⃣ Worker 代码（iPhone 和安卓都运行 → `worker.py`）

> 每个设备都运行这个脚本，它们会去 Mac 那里领任务，处理，然后返回结果。

```python
# worker.py —— 在 iPhone 和安卓上运行
import requests

# 🔧 重点：改成你 Mac 的 局域网 IP 地址！！
MASTER_URL = 'http://192.168.x.x:5000'  # ← 替换为你的 Mac 的 IP（后面会告诉你怎么查）

def do_some_work(task_data):
    # 这里写你的计算逻辑，现在只是模拟一下
    print(f"🤖 正在处理任务：{task_data}")
    result = f"【已搞定】{task_data}"
    return result

print("🔁 Worker 启动，等待任务中...")
while True:
    try:
        # 1. 去主控那拿任务
        r = requests.get(f"{MASTER_URL}/get_task")
        task = r.json().get('task')

        if not task:
            print("✅ 没任务了，Worker 暂停。")
            break

        task_id = task['id']
        task_data = task['data']

        # 2. 做任务（可自定义，比如 AI 推理、OCR、计算等）
        result = do_some_work(task_data)

        # 3. 提交结果给主控
        requests.post(
            f"{MASTER_URL}/submit_result",
            json={"task_id": task_id, "result": result}
        )

    except Exception as e:
        print(f"❌ 出错：{e}")
```

---

## ▶️ 三、1分钟极速操作指南

### ✅ 第一步：在 Mac 上查 IP 地址

打开 **Mac 的终端（Terminal）**，输入：

```bash
ifconfig | grep "inet 192.168"
```

你会看到类似这样的输出：

```
inet 192.168.1.100  netmask ...
```

👉 把其中的 `192.168.1.100`（你的实际局域网 IP）记下来，这就是你的 Mac 在 Wi-Fi 中的地址！

---

### ✅ 第二步：在 Mac 上运行主控（Master）

1. 打开 **Mac 上的“终端”**
2. 创建代码文件（或直接复制上面 `master.py` 的内容）
3. 运行：

```bash
python3 master.py
```

🔥 你会看到类似提示：

```
🚀 Mac 主控已启动！请在 iPhone 和安卓设备访问：http://192.168.1.100:5000/get_task
```

👉 **把这个 IP（比如 192.168.1.100）记下来，下一步要用！**

---

### ✅ 第三步：在 iPhone 和安卓上运行 Worker

#### 📱 iPhone 上运行（推荐使用 **Pyto** 或 **a-Shell**）：

1. **下载 Pyto（推荐）**：App Store 搜索 **https://apps.apple.com/us/app/pyto-python-3/id1436650060**（付费但好用，支持 Python3 + requests + 网络）
   - 或者用 **a-Shell**（免费，功能强大，支持网络请求）
2. 打开 App，新建一个脚本，粘贴上面的 `worker.py` 代码
3. **修改这一行**：
   ```python
   MASTER_URL = 'http://192.168.1.100:5000'  # ← 替换成你 Mac 的 IP！
   ```
4. 点击运行 → Worker 会自动连接 Mac，领任务、计算、返回结果！

---

#### 🤖 安卓上运行（推荐使用 **Termux**）：

1. **安装 Termux（Google Play 或 F-Droid）**
2. 打开 Termux，依次输入以下命令安装 Python 和 requests：

```bash
pkg update
pkg install python
pip install requests
```

3. 创建 `worker.py` 文件：

```bash
nano worker.py
```

4. 粘贴 worker.py 代码，**记得修改这行：**

```python
MASTER_URL = 'http://192.168.1.100:5000'  # ← 换成你 Mac 的实际 IP！
```

5. 按 Ctrl+O 保存，Ctrl+X 退出，然后运行：

```bash
python worker.py
```

---

## 🎉 四、你将看到什么？

- **Mac（主控）屏幕**会打印类似：

```
✅ 收到来自 Worker 的结果：任务1 => 【已搞定】任务1：Mac请你算 1+1
✅ 收到来自 Worker 的结果：任务2 => 【已搞定】任务2：Mac请你算 2+2
...
```

- **iPhone 和安卓的 Worker**会显示正在领任务、处理、返回结果。

---

## 🧠 你可以马上尝试的扩展玩法：

| 想法 | 操作 |
|------|------|
| ✅ 换成真实任务 | 把 `tasks` 列表里的内容改成：图片路径、文本、音频、待处理的 JSON 数据等 |
| ✅ 做点实际计算 | 比如让 Worker 帮你做 OCR、翻译、加解密、调用 API、AI 推理等 |
| ✅ 多个任务并发 | 给 tasks 列表添加更多任务，看多个设备一起帮你干活 |
| ✅ 手机充电时挂机 Worker | 让 iPhone / 安卓在充电时持续运行 Worker，帮 Mac 干活 |

---

## ✅ 总结：1分钟你做到了什么？

| 项目 | 说明 |
|------|------|
| 🖥️ 主控 | 用 Mac 轻松搭建任务分发中心（master.py） |
| 📱 手机算力 | iPhone 和安卓秒变 Worker，通过 Wi-Fi 协同计算 |
| 🌐 通信 | 局域网 HTTP，无需公网、不用复杂配置 |
| 🧠 扩展性 | 可轻松改造成 OCR、AI推理、批量处理等真实应用场景 |

---

## 🚀 下一步建议：

- 想让我给你一个 **打包好的代码包 / 一键脚本 / iPhone 安装包推荐 / 图形界面版本**？
- 想试试用这些设备跑 **AI 推理、批量图片处理、转码、爬虫等实战任务**？
- 想把系统升级成 **带任务队列、进度条、Web 界面** 的版本？

👉 你只需要说一声，我可以继续帮你 1 步 1 步升级，打造属于你的「私人分布式小算力云」！ 💪😎