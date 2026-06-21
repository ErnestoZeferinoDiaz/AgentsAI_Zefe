cd /workspace
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp
cmake -B build -DGGML_CUDA=ON -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release --target llama-server --parallel 64
./build/bin/llama-cli --help
echo "Revisa este archivo para correr Llama con tu modelo"
#./build/bin/llama-server -m /workspace/models/Qwen3-Coder-30B-A3B-Instruct-Q4_K_M.gguf --host 0.0.0.0 --port 8675 -ngl 999
