cd /workspace
git clone https://github.com/ggerganov/llama.cpp.git
cd llama.cpp

#cmake -B build -DGGML_CUDA=ON -DCMAKE_BUILD_TYPE=Release
cmake -B build \
      -DGGML_CUDA=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -DLLAMA_BUILD_TESTS=OFF \
      -DLLAMA_BUILD_EXAMPLES=OFF \
      -DCMAKE_NATIVE_INSTRUCTIONS=ON

cmake --build build --config Release --target llama-server --parallel $(nproc)


# Verificar que el servidor se compiló correctamente
./build/bin/llama-server --help

echo "--------------------------------------------------"
echo "Compilación exitosa. Revisa este archivo para correr Llama con tu modelo."
echo "Para iniciar el servidor usa un comando como este:"
echo "./build/bin/llama-server -m /ruta/a/tu/modelo.gguf --port 8080"
#./build/bin/llama-server -m /workspace/models/Qwen3-Coder-30B-A3B-Instruct-Q4_K_M.gguf --host 0.0.0.0 --port 8675 -ngl 999


