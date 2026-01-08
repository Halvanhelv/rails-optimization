```bash
brew install rbspy
DATA_FILE=large.txt ruby work.rb # run long process
sudo rbspy record --pid 58587 # attach to running process
sudo rbspy record ruby my-script.rb # build flamegraph
```
