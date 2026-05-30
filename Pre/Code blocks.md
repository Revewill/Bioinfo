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

```python
import scanpy as sc
adata = sc.read_10x_h5("raw_data.h5")         # 读取数据
sc.pp.filter_cells(adata, min_genes=200)      # 质控
sc.pp.normalize_total(adata)                  # 归一化
sc.pp.log1p(adata)                            # 对数变换
sc.tl.pca(adata)                              # PCA
sc.pp.neighbors(adata)                        # 构建图
sc.tl.umap(adata)                             # 降维
sc.tl.leiden(adata)                           # 聚类
# 手动注释细胞类型
adata.write("data.h5ad")                      # 保存
```


#### 3.2 Start CellWhisperer

```bash
$ pixi run cellxgene launch -p 5005 --host 0.0.0.0 \
  --var-names gene_name \
  resources/tabula_sapiens/cellxgene.h5ad
```