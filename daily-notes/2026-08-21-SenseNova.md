```sh
git clone https://github.com/OpenSenseNova/SenseNova-U1
cd SenseNova-U1 && uv sync
python examples/t2i/inference.py \
  --model_path sensenova/SenseNova-U1.5-8B-MoT-SFT \
  --prompt "A cinematic mountain lake at sunrise" \
  --width 2048 --height 2048 --device_map auto --output out.png

```