## Conda

```sh
# install conda
conda create -n lf python=3.10
conda --version
conda activate lf
conda env list

# Install from Source LLaMA-Factory 
git clone --depth 1 https://github.com/hiyouga/LLaMA-Factory.git
cd LLaMA-Factory
pip install -e ".[torch,metrics]" --no-build-isolation

# Install from Docker Image
docker run -it --rm --gpus=all --ipc=host hiyouga/llamafactory:latest

# 启用web界面（要等一会儿）
llamafactory-cli webui
```


# 遇到的问题：使用llamafactory-cli webui时提示You are using a non-instruct model, please fine-tune it first.

解决方案：模型选一个Alpaca，比如`Chinese-Alpaca-2-1.3B-Chat`

智能回答：

在使用 `llamafactory-cli webui` 启动 Web 界面时，如果你看到如下提示：

```
You are using a non-instruct model, please fine-tune it first.
```

这表示你当前加载的模型 **不是一个经过指令微调（instruction-tuned）的模型**，而 LLaMA Factory 的 Web UI 通常期望使用的是 **已经过指令微调的模型**（例如：经过 Alpaca、Vicuna、ChatGLM 等方式微调过的模型），以便能够更好地进行对话交互。

---

## 为什么会出现这个提示？

LLaMA Factory 是一个用于微调和部署大语言模型（如 LLaMA、Mistral、Falcon 等）的工具。它支持多种任务，包括：

- 指令微调（instruction tuning）
- 多轮对话微调
- SFT（Supervised Fine-Tuning）
- DPO（Direct Preference Optimization）等

当你使用 `llamafactory-cli webui` 启动 Web 界面时，它会尝试加载你指定的模型路径。如果该模型 **没有经过指令微调**（即它只是一个基础语言模型，如原始的 LLaMA 模型），那么 Web UI 就无法正确地与模型进行对话交互，因此会提示你：

> You are using a non-instruct model, please fine-tune it first.

意思是：你正在使用一个**非指令微调模型**，请先对其进行微调。

---

## 如何解决这个问题？

你有以下几种解决方案：

### ✅ 方案一：使用已经过指令微调的模型

最简单的办法是：**使用一个已经经过指令微调的模型**（如 Vicuna、Alpaca、ChatGLM 等）。

你可以：

1. 从 Hugging Face 或其他模型仓库下载一个已经微调好的模型（例如：`lmsys/vicuna-7b-v1.5` 或其他类似模型）。
2. 在 `llamafactory-cli webui` 启动时，指定该模型的路径或 Hugging Face 模型名称。
3. 这样 Web UI 就能正常加载并进行对话。

🔹 示例命令：
```bash
llamafactory-cli webui --model_name_or_path lmsys/vicuna-7b-v1.5
```

或者如果你本地有微调好的模型：
```bash
llamafactory-cli webui --model_name_or_path /path/to/your/fine-tuned-model
```

---

### ✅ 方案二：自己微调一个指令微调模型

如果你手头只有**基础模型**（如原始的 LLaMA 模型），而**没有经过指令微调**，那么你需要**先进行微调**，才能在 Web UI 中使用。

你可以：

1. 准备好微调数据（如 Alpaca 格式的指令数据）。
2. 使用 LLaMA Factory 提供的微调功能（如 `train_web.py` 或 `llamafactory-cli train`）来微调你的模型。
3. 微调完成后，得到一个**指令微调后的模型**。
4. 然后使用 `llamafactory-cli webui` 加载这个微调后的模型。

🔹 示例微调命令（简化版）：
```bash
llamafactory-cli train --model_name_or_path meta-llama/Llama-2-7b-hf \
                       --dataset alpaca_en_demo \
                       --template vicuna \
                       --finetuning_type lora \
                       --output_dir ./output
```

微调完成后，`./output` 目录下就是你的微调模型，之后可以用 Web UI 加载它。

---

### ❗ 注意事项：

- **基础模型（如原始 LLaMA）不能直接用于对话**，因为它没有理解“指令”的能力。
- **指令微调**是将模型教会如何理解和响应人类指令（如问答、聊天等）的过程。
- 如果你不确定你的模型是否是“指令微调”过的，可以查看模型的来源或训练历史。

---

## 总结

你遇到的提示：

> You are using a non-instruct model, please fine-tune it first.

意思是：你当前加载的模型**不是经过指令微调的模型**，而 LLaMA Factory 的 Web UI 需要**指令微调模型**才能正常工作。

✅ 解决方法：

1. **使用已有的指令微调模型**（如 Vicuna、Alpaca 等）。
2. **自己微调一个指令微调模型**（使用 LLaMA Factory 的微调功能）。

如果你希望继续使用 Web UI 进行对话，**推荐使用方案一**，即直接加载一个已经微调好的模型。

如果你需要帮助选择或下载已微调的模型，我也可以提供推荐。

