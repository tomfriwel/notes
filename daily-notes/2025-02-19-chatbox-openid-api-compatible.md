# Chatbox配置

左下角`Settings>MODEL>Model Provider>Add Custom Provider>API Mode>OpenAI API Compatible`


### 获取腾讯云的API KEY
腾讯云
https://console.cloud.tencent.com/lkeap/api
`API KEY管理>创建API KEY`


base_url：https://api.lkeap.cloud.tencent.com/v1
https://cloud.tencent.com/document/product/1772/115969

说明：
本接口调用 DeepSeek 系列模型限时免费。
即日起至北京时间***2025年2月25日23:59:59***，所有腾讯云用户通过知识引擎原子能力腾讯云 API 接口和兼容 OpenAI的接口调用DeepSeek系列模型均可享受 DeepSeek-V3、DeepSeek-R1 模型限时免费服务，单账号限制接口并发上限为5。在优惠结束之后，模型价格将恢复至原价。

### 继续配置：

API Host: `https://api.lkeap.cloud.tencent.com/v1`

API Path: `/chat/completions`

Model: `deepseek-r1`（下拉有个加号，再添加`deepseek-v3`）

DeepSeek-R1（model 参数值为 deepseek-r1）

DeepSeek-R1 为671B 模型，使用强化学习训练，推理过程包含大量反思和验证，思维链长度可达数万字。 该系列模型在数学、代码以及各种复杂逻辑推理任务上推理效果优异，并为用户展现了完整的思考过程。
DeepSeek-V3（model 参数值为 deepseek-v3）

DeepSeek-V3 为671B 参数 MoE 模型，在百科知识、数学推理等多项任务上优势突出。

