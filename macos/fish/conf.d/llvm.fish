fish_add_path --path /opt/homebrew/opt/llvm/bin
set -gx LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/llvm/include
set -gx LIBCLANG_PATH /opt/homebrew/opt/llvm/lib
