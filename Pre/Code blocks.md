# Code Blocks
### 1. Preparation

#### 1.1 Pixi

```bash
$ conda activate <py_env>
$ python script.py
$ conda deactivate
```

```bash
$ pixi run python script.py
```

#### 1.2 Install Pixi

```bash
$ curl -fsSL https://pixi.sh/install.sh | bash
$ source ~/.bashrc
```

### 2. Installation

```bash
# 1. Clone repository
$ git clone https://github.com/epigen/cellwhisperer.git --recurse-submodules
$ cd cellwhisperer

# 2. Install
$ ./envs/setup_pixi.sh

# 3. Verify installation
$ pixi run cellxgene --version
```

### 3. Demonstration

#### 3.1 Download data set

```bash
# 1. Download data set
$ mkdir -p resources/tabula_sapiens
$ nohup wget -c -O resources/tabula_sapiens/cellxgene.h5ad \
  https://www.medical-epigenomics.org/papers/schaefer2025cellwhisperer/data/datasets/tabula_sapiens/cellxgene.h5ad &

# Use the following command to check realtime progress
$ tail -f nohup.out

# 2. Verify download
$ ls -lh resources/tabula_sapiens/cellxgene.h5ad
```

#### 3.2 Start CellWhisperer

```bash
$ pixi run cellxgene launch -p 5005 --host 0.0.0.0 \
  --var-names gene_name \
  resources/tabula_sapiens/cellxgene.h5ad
```