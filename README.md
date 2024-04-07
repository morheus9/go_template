# Golang telegram speech to text bot
## 
[![GoLint](https://github.com/morheus9/tg_bot_trading/actions/workflows/go_lint.yml/badge.svg?branch=main)](https://github.com/morheus9/tg_bot_trading/actions/workflows/go_lint.yml)
[![Gotest](https://github.com/morheus9/tg_bot_trading/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/morheus9/tg_bot_trading/actions/workflows/tests.yml)
[![CodeQL](https://github.com/morheus9/tg_bot_trading/actions/workflows/codeql.yml/badge.svg?branch=main)](https://github.com/morheus9/tg_bot_trading/actions/workflows/codeql.yml)
[![DockerCI:](https://github.com/morheus9/tg_bot_trading/actions/workflows/docker-ci.yml/badge.svg?branch=main)](https://github.com/morheus9/tg_bot_trading/actions/workflows/docker-ci.yml)

1. Clone whisper
```
git clone https://github.com/ggerganov/whisper.cpp.git && cd whisper.cpp
```
2. Make it
```
make
```
3. Download models, there are different models available:
| Model  | Disk    |  Memory usage  |
| ------ | ------- |  ------------- |
| tiny   | 75 MiB  |     ~273 MB    |
| base   | 142 MiB |     ~388 MB    |
| small  | 466 MiB |     ~852 MB    |
| medium | 1.5 GiB |     ~2.1 GB    |
| large  | 2.9 GiB |     ~3.9 GB    |
More info: https://github.com/ggerganov/whisper.cpp/blob/master/README.md
# To download some models do:
```
./models/download-ggml-model.sh large-v3
```
4. If you want to - whisper.cpp supports integer quantization of the Whisper ggml models. Quantized models require less memory and disk space and depending on the hardware can be processed more efficiently.
# for creating a quantized model do:
```
make quantize
./quantize models/ggml-large-v3.bin models/ggml-large-v3-q5_0.bin q5_0
```
# You can also download samples:
```
make samples
```
#  You can check your whisper, specifying the quantized model file:
```
./main -m models/ggml-base.en-q5_0.bin ./samples/gb0.wav
```
5. Install ffmpeg. You can check this by:
```
$ which ffmpeg
/usr/bin/ffmpeg
```
5. Add ENVs to your system. Path to your model and your telegram bot token. 
More (https://core.telegram.org/bots/tutorial#obtain-your-bot-token)
```
export TELEGRAM_APITOKEN=<your bot token here>
export MODELPATH=whisper.cpp/models/ggml-tiny.en.bin
```
6. Build bot:
```
go get
C_INCLUDE_PATH=/app/whisper.cpp/ LIBRARY_PATH=/app/whisper.cpp/ go build -o whisper_bot
```
7. Start bot:
```
./whisper_bot
```
