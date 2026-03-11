# Notes on `R` learning
- [Notes on `R` learning](#notes-on-r-learning)
  - [1. Package installation and basic commands](#1-package-installation-and-basic-commands)
    - [1.1  **Install packages**](#11--install-packages)
    - [1.2 **Basic Commands**](#12-basic-commands)
  - [2. Data Type and Data Structure in `R`](#2-data-type-and-data-structure-in-r)
    - [2.1 **Data Type**](#21-data-type)
    - [2.2 **Data Structure**](#22-data-structure)
      - [2.2.1 **Vectors**](#221-vectors)
        - [2.2.1.1 Basics in Vector](#2211-basics-in-vector)
          - [2.2.1.1.1 **Creating** vectors](#22111-creating-vectors)
          - [2.2.1.1.2 **Accessing** elements within a vector](#22112-accessing-elements-within-a-vector)
          - [2.2.1.1.3 **Modifying** elements within a vector](#22113-modifying-elements-within-a-vector)
          - [2.2.1.1.4 **Deleting** elements within a vector](#22114-deleting-elements-within-a-vector)
        - [2.2.1.2 Advance in Vector](#2212-advance-in-vector)
          - [2.2.1.2.1 🚩 `paste` function](#22121--paste-function)
          - [2.2.1.2.2 **Calculation** of vectors](#22122-calculation-of-vectors)
          - [2.2.1.2.3 Extension on data type: `NA` and `NULL`](#22123-extension-on-data-type-na-and-null)
        - [2.2.1.3 *Logi* Vectors](#2213-logi-vectors)
        - [2.2.1.4 🚩 *Chr* Vectors](#2214--chr-vectors)
      - [2.2.2 **Matrices**](#222-matrices)
        - [2.2.2.1 Basics in Matrices](#2221-basics-in-matrices)
          - [2.2.2.1.1 **Creating** matrices](#22211-creating-matrices)
          - [2.2.2.1.2 **Accessing** and **modifying** elements within a matrix](#22212-accessing-and-modifying-elements-within-a-matrix)
          - [2.2.2.1.3 **Calculation** of matrices](#22213-calculation-of-matrices)
        - [2.2.2.2 Advance in Matrices](#2222-advance-in-matrices)
          - [2.2.2.2.1 🚩 **Operation** on rows and cols](#22221--operation-on-rows-and-cols)
          - [2.2.2.2.2 **Advance calculation** of matrices](#22222-advance-calculation-of-matrices)
      - [2.2.3 **Arrays**](#223-arrays)
        - [2.2.3.1 Basics in Array](#2231-basics-in-array)
          - [2.2.3.1.1 **Creating** arrays](#22311-creating-arrays)
          - [2.2.3.1.2 **Accessing** elements within an array](#22312-accessing-elements-within-an-array)
      - [2.2.4 **Data frames**](#224-data-frames)
        - [2.2.4.1 Basics in Data frame](#2241-basics-in-data-frame)
          - [2.2.4.1.1 **Creating** data frames](#22411-creating-data-frames)
          - [2.2.4.1.2 **Accessing** and **modifying** elements within a data frame](#22412-accessing-and-modifying-elements-within-a-data-frame)
          - [2.2.4.1.2 **Operation** on rows and cols](#22412-operation-on-rows-and-cols)
      - [2.2.5 **Lists**](#225-lists)
        - [2.2.5.1 Basics in List](#2251-basics-in-list)
          - [2.2.5.1.1 **Creating** lists](#22511-creating-lists)
          - [2.2.5.1.2 **Accessing** and **modifying** elements within a list](#22512-accessing-and-modifying-elements-within-a-list)
          - [2.2.5.1.3 **Operation** on lists](#22513-operation-on-lists)
        - [2.2.5.2 Advance in List](#2252-advance-in-list)
  - [3. Data Management](#3-data-management)
    - [3.1 **Importing** and **exporting** common files](#31-importing-and-exporting-common-files)
      - [3.1.1 `csv` and `xlsx` files](#311-csv-and-xlsx-files)
        - [3.1.1.1 **Reading** and **saving** `csv` files](#3111-reading-and-saving-csv-files)
        - [3.1.1.2 **Operation** on `xlsx` files](#3112-operation-on-xlsx-files)
      - [3.1.2 `txt` files](#312-txt-files)

---
## 1. [Package installation](#11--install-packages) and [basic commands](#12-basic-commands)
> Enter `RStudio` and create a new `R` file. Edit it and click `run` to check results in `console`.

### 1.1  **Install packages**
> Go [back](#1-package-installation-and-basic-commands), go [down](#12-basic-commands), or go to [top](#notes-on-r-learning).

<a name="code1"></a>
```R
install.packages("package")
# or with BiocManager
BiocManager::install("package", ask = F, update = F`)
```
> <small>**Functions in this block:** [`install.packages`](#apx-install.packages), [`install`](#apx-install)</small>
* **`R` Packages** are sets of **functions**
* `BiocManager` is a platform for bioinformatic package installation
* For Packages to take effect, use

    <a name="code2"></a>
    ```R
    library("package")
    ```
    > <small>**Functions in this block:** [`library`](#apx-library)</small>
### 1.2 **Basic Commands**
> Go [back](#1-package-installation-and-basic-commands), go [down](#2-data-type-and-data-structure-in-r), or go to [top](#notes-on-r-learning).
* Get/Set working dir

    <a name="code3"></a>
    ```R
    getwd()
    setwd("working_dir")
    ```
    > <small>**Functions in this block:** [`getwd`](#apx-getwd), [`setwd`](#apx-setwd)</small>
* Set variables

    <a name="code4"></a>
    ```R
    a <- 0
    # or
    a = 0
    ```
  > `<-` could be typed with `Alt`+`-`
* Remove

    <a name="code5"></a>
    ```R
    rm("sth")
    ```
    > <small>**Functions in this block:** [`rm`](#apx-rm)</small>
---
## 2. Data Type and Data Structure in `R`
### 2.1 **Data Type**
> Go [back](#2-data-type-and-data-structure-in-r), go [down](#22-data-structure), or go to [top](#notes-on-r-learning).
* Three main types: **numeric** (*num*), **logical** (*logi*) and **character** (*chr*)
  * *e.g.*, these `3` variables represent `3` different data type

    <a name="code6"></a>
    ```R
    a <- 1.4
    b <- TRUE
    d <- "abc"
    e <- as.integer(2.99)
    ```
    > <small>**Functions in this block:** [`as.integer`](#apx-as.integer)</small>
    > **`c` is a function**, therefore not commonly used as variables.
  * `class` and `is` function tells the data type

    <a name="code7"></a>
    ```R
    class(a)    # Returns numeric
    class(b)    # Returns logical
    class(d)    # Returns character
    class(e)    # Returns integer
    e   # Returns 2

    is.numeric(a)   # Returns TRUE
    is.integer(a)   # Returns FALSE
    is.integer(e)   # Returns TRUE
    ```
    > <small>**Functions in this block:** [`class`](#apx-class), [`is.numeric`](#apx-is.numeric), [`is.integer`](#apx-is.integer)</small>
* One special type: **factor**
  * **Factors** are *chr* vectors
    * The only difference: a vector is a set of data, a factor is data itself
      * `c("A","T","G","C")` is a vector in which elements are not interconnected
      * `factor("A","T","G","C")` is a factor in which these letters are interconnected as a whole
    * `levels` sorts out all unique letters in a factor and assign them numeric values
      * *e.g.*, `"A","T","G","C"` -> `1,2,3,4`
      * Factor is stored in the corresponding numeric format
    * `labels` are labels you attach to levels
    * `ordered` is a *logi* value that determines whether levels are sorted in order
  * Creating factors
    * Creating factors with `factor`
      <a name="code8"></a>
      ```R
      factor(chr_vector, levels, labels, ordered = TRUE)
      
      v <- c("A","G","T","C","A")
      factor(v)
      # Returns
      A G T C A
      Levels: A C G T
      # No levels argument: default order (num -> chr)

      # levels
      factor(v, levels = c("A","T","G","C")) 
      # Returns
      A G T C A
      Levels: A T G C

      # labels
      factor(
        v, levels = c("A","T","G","C"),
        labels = c("Adenine", "Thymine", "Guanine", "Cytosine")
      )
      # Returns
      Adenine Guanine Thymine Cytosine Adenine
      Levels: Adenine Thymine Guanine Cytosine

      # Transform between data type/structure (as function)
      as.factor(v)
      ```
      > <small>**Functions in this block:** [`factor`](#apx-factor), [`c`](#apx-c), [`order`](#apx-order), [`structure`](#apx-structure), [`as.factor`](#apx-as.factor)</small>
    * Creating factors with `gl`
      <a name="code9"></a>
      ```R
      gl(num_of_levels, num_of_repeats, labels)

      gl(4, 2, labels = c("A","T","G","C"))
      # Returns
      A A T T G G C C
      Levels: A T G C
      ```
      > <small>**Functions in this block:** [`gl`](#apx-gl), [`c`](#apx-c)</small>
  * Practical use of factors
    <a name="code10"></a>
    ```R
    # Used in sorting
    size <- c("XS","S","L","XL","M")

    # Normal sorting: alphabetic order
    sort(size)  # Returns "L" "M" "S" "XL" "XS"
    
    # Factor sorting: appointed order
    F_size <- factor(size, labels = c("XS","S","M","L","XL"))
    sort(F_size)
    # Returns
    XS S M L XL
    Levels: XS S M L XL
    ```
    > <small>**Functions in this block:** [`c`](#apx-c), [`sort`](#apx-sort), [`factor`](#apx-factor)</small>
### 2.2 **Data Structure**
> Go [back](#2-data-type-and-data-structure-in-r), go [down](#221-vectors), or go to [top](#notes-on-r-learning).

> Are storage forms of data, including [Vectors](#221-vectors), [Matrices](#222-matrices), [Arrays](#223-arrays), [Data frame](#224-data-frames), [List](#225-lists).
#### 2.2.1 **Vectors**
* **Vectors** are **strings** of data **of a same type** placed in order
##### 2.2.1.1 Basics in Vector
> Go [back](#221-vectors), go [down](#2212-advance-in-vector), or go to [top](#notes-on-r-learning).
###### 2.2.1.1.1 **Creating** vectors
* *e.g.*, `a` is a *num* vector, `b` is a *chr* vector, `c` is a *logi* vector

    <a name="code11"></a>
    ```R
    a <- c(-1,0,1,2,3,4,5)
    b <- c("one", "two", "three", "four", "five")
    d <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

    # Creating a consecutive sequence of numbers
    a <- c(1:10)

    # Creating sequences with seq function
    # seq(from, to, step)
    a <- seq(1,10,2)    # a <- c(1,3,5,7,9)

    # Creating sequences with rep function
    # rep(number, times_of_repeats)
    a <- rep(3,4)   # a <- c(3,3,3,3)
    ```
    > <small>**Functions in this block:** [`c`](#apx-c), [`seq`](#apx-seq), [`rep`](#apx-rep)</small>
###### 2.2.1.1.2 **Accessing** elements within a vector

<a name="code12"></a>
```R
a <- c(-1,0,1,2,3,4,5)

# Accessing the third element in a
a[3]    # Returns: 1

# Accessing the first, third and fourth elements in a
a[c(1,3,4)]    # Returns: -1 1 2

# Accessing the second to sixth elements in a
a[2:6]   # Returns: 0 1 2 3 4
```
> <small>**Functions in this block:** [`c`](#apx-c)</small>
###### 2.2.1.1.3 **Modifying** elements within a vector

<a name="code13"></a>
```R
a <- c(-1,0,1,2,3,4,5)

# Modifying the first element in a
a[1] <- -2
a   # Returns: -2 0 1 2 3 4 5

# Modifying the second and seventh elements in a
a[c(2,7)] <- c(5,0)
a   # Returns: -2 5 1 2 3 4 0

# Modifying the third to sixth elements in a
a[3:6] <- c(4:7)
a   # Returns: -2 5 4 5 6 7 0
```
> <small>**Functions in this block:** [`c`](#apx-c)</small>
###### 2.2.1.1.4 **Deleting** elements within a vector

<a name="code14"></a>
```R
a <- c(-1,0,1,2,3,4,5)

# Deleting the first element in a
a[-1]   # Returns: 0 1 2 3 4 5
a <- a[-1] # Commiting deletion to a itself
a   # Returns: 0 1 2 3 4 5

# Deleting the first and sixth elements in a
a[-c(1,6)]  # Returns: 1 2 3 4
a <- a[-c(1,6)]

# Deleting the second to fourth elements in a
a[-(2:4)]   # Returns: 1
```
> <small>**Functions in this block:** [`c`](#apx-c)</small>
##### 2.2.1.2 Advance in Vector
> Go [back](#221-vectors), go [down](#2213-logi-vectors), or go to [top](#notes-on-r-learning).
###### 2.2.1.2.1 🚩 `paste` function

<a name="code15"></a>
```R
# Basic format
paste("A","B","C",1:3,sep = 'sep')
# Returns "AsepBsepCsep1" "AsepBsepCsep2" "AsepBsepCsep3"
# Pastes the elements together separated by an appointed separator

a <- paste("chr","omosome",1:3,sep = '')
# Returns "chromosome1" "chromosome2" "chromosome3"

a <- paste("chr","X",1:3,sep = "_")
# Returns "chr_X_1" "chr_X_2" "chr_X_3"

# Collapse argument
a <- paste("chr","X",1:3,sep = "_",collapse = ";")
# Returns "chr_X_1;chr_X_2;chr_X_3"
# This argument joins all characters together
```
> <small>**Functions in this block:** [`paste`](#apx-paste)</small>
###### 2.2.1.2.2 **Calculation** of vectors

<a name="code16"></a>
```R
a <- c(1:10)

# min and max function
min(a)  # Returns 1
max(a)  # Returns 10

# which function
which.min(a)    # Returns 1 (the location of min)
which.max(a)    # Returns 10 (the location of max)

# statistic functions
sum(a)  # Returns 55
sum(1:100)  # Returns 5050
median(a)   # Returns 中位数
prod(a) # Returns 10! 求积
var(a)  # Returns 方差
mean(a) # Returns 平均数
                
# sorting functions
sort(a) # Sorts the elements in a (升序)
rev(a)  # Sorts the elements in a (倒序)
order(a)    # Sorts the elements in a (升序) and returns the location of the elements
a(order(a)) # Equals to sort(a)
```
> <small>**Functions in this block:** [`c`](#apx-c), [`min`](#apx-min), [`max`](#apx-max), [`which.min`](#apx-which.min), [`which.max`](#apx-which.max), [`sum`](#apx-sum), [`median`](#apx-median), [`prod`](#apx-prod), [`var`](#apx-var), [`mean`](#apx-mean), [`sort`](#apx-sort), [`rev`](#apx-rev), [`order`](#apx-order)</small>
###### 2.2.1.2.3 Extension on data type: `NA` and `NULL`
* Functions

    | `NA` | `NULL` |
    | :---: | :---: |
    | represents lack of data | represents non-existing data |
    | a position without data | no position and no data |
* *e.g.*,

    <a name="code17"></a>
    ```R
    a <- c(NA, NULL, NA)
    a   # Returns NA NA
    length(c(NA, NULL, NA))   # Returns 2
    ```
    > <small>**Functions in this block:** [`c`](#apx-c), [`length`](#apx-length)</small>
##### 2.2.1.3 *Logi* Vectors
> Go [back](#221-vectors), go [down](#2214--chr-vectors), or go to [top](#notes-on-r-learning).

<a name="code18"></a>
```R
# Comparing values
c(1,2,3) > 2    # Returns FALSE FALSE TRUE
a <- c(1,2,3)
b <- a > 2  # b is FALSE FALSE TRUE
a[b]    # Returns 3
# When the length of vector a equals to the length of logi vector b, a[b] returns all elements in a that correspond to TRUE in b

# Likewise:
a <- c(5,1,7,3,9)
a[a >= 2 & a <= 7]  # Returns 5 7 3
# Because a >= 2 & a <= 7 returns TRUE FALSE TRUE TRUE FALSE

# AND (&) OR (|) NOT (!)
a[a >= 7 | a <= 2]  # Returns 1 7 9
a[!a >= 7]  # Returns 5 1 3
```
> <small>**Functions in this block:** [`c`](#apx-c)</small>
##### 2.2.1.4 🚩 *Chr* Vectors
> Go [back](#221-vectors), go [down](#222-matrices), or go to [top](#notes-on-r-learning).

<a name="code19"></a>
```R
# UPPER and lower case
toupper("RevewillH")  # Returns REVEWILLH
tolower("RevewillH")    # Returns revewillh

# Character counts
nchar("RevewillH", type="bytes")    # Length of bytes
nchar("RevewillH", type="char") # Length of characters

# Capture characters
substring("RevewillH", 1, 4)    # Returns Reve
substring("RevewillH", 5)   # Returns willH (Default: a single number = from it to the end)

# Switch between num and chr
as.numeric(c("1","23"))    # Returns 1 23
as.character(c(12.34, 56.78))   # Returns "12.34" "56.78"

# 🚩 Operation on chr strings
# Split
strsplit("chr_string", "separator")
strsplit("1;2;3", ";")  # Returns 1 2 3
# Switch
gsub("old_chr", "new_chr", "chr_string")
gsub("_", "omosome_", "chr_1")    # Returns chromosome_1
# In gsub, old_chr supports Regular Expression
gsub("[[:alpha:]]+", "$", "revewill H") # Returns "$ $"
gsub("[[:alnum:]]+", "$", "1 23 456") # Returns "$ $ $"
```
> <small>**Functions in this block:** [`toupper`](#apx-toupper), [`tolower`](#apx-tolower), [`nchar`](#apx-nchar), [`substring`](#apx-substring), [`as.numeric`](#apx-as.numeric), [`c`](#apx-c), [`as.character`](#apx-as.character), [`strsplit`](#apx-strsplit), [`gsub`](#apx-gsub)</small>
> ※ `[[:pattern:]]` is a regular expression corresponding to **one match** of `pattern`. `alpha` means *letters* (ignoring upper/lower cases), `alnum` means *numbers*, `+` means the pattern before `+` *can occur single or multiple time(s)*.
> See [regular expression]() for more.
#### 2.2.2 **Matrices**
* **Matrices** are **`2D` strings** of data **of a same type**
##### 2.2.2.1 Basics in Matrices
> Go [back](#222-matrices), go [down](#2222-advance-in-matrices), or go to [top](#notes-on-r-learning).

###### 2.2.2.1.1 **Creating** matrices
* Create matrix with `matrix` function

    <a name="code20"></a>
    ```R
    matrix(data = data, nrow = m, ncol = n, byrow = TRUE, dimnames = list)
    ```
    > <small>**Functions in this block:** [`matrix`](#apx-matrix)</small>
    * `data` is the source data, must be **$m*n$** sized
    * `nrow` is the number of rows
    * `ncol` is the number of columns
    * `byrow` dictates whether `data` is filled into the matrix by row or column order
      * `byrow = TRUE`: data is filled by row
      * `byrow = FALSE` or no `byrow` argument: data is filled by column
    * `dimnames` is the name of each row or column (if you are working a form)
      * Normally inputed in a list form
      * `dimnames = NULL` or no `dimnames` argument means no dimnames
    > *e.g.*,
    
    <a name="code21"></a>
    ```R
    matrix(data = 1:10, nrow = 2, ncol = 5, byrow = TRUE, dimnames = NULL)
    # Returns
    1 2 3 4  5
    6 7 8 9 10

    matrix(data = 1:10, nrow = 2, ncol = 5)
    # Returns
    1 3 5 7  9
    2 4 6 8 10
    ```
    > <small>**Functions in this block:** [`matrix`](#apx-matrix)</small>
* Creating matrix with vectors

    <a name="code22"></a>
    ```R
    # Assign data
    cells <- c(1:4)

    # Assign dimnames
    rnames <- c("R1", "R2")
    nnames <- c("C1", "C2")

    # Create matrix
    A <- matrix(cells, nrow = 2, ncol = 2, byrow = TRUE, dimnames = list(rnames, nnames))
    A
    # Returns
        C1 C2
    R1   1  2
    R2   3  4

    # Define dimnames after creating matrix
    A <- matrix(data = 1:4, nrow = 2, ncol = 2)
    rownames(A) = c("Row1", "Row2")
    colnames(A) = c("Col1", "Col2")
    A
    # Returns
          Col1 Col2
    Row1     1    3
    Row2     2    4
    ```
    > <small>**Functions in this block:** [`c`](#apx-c), [`matrix`](#apx-matrix), [`list`](#apx-list), [`rownames`](#apx-rownames), [`colnames`](#apx-colnames)</small>
* ※ Creating things with random numbers

  <a name="code23"></a>
  ```R
  matrix(rnorm(15),5,3)
  # Returns a 5*3 matrix with 15 random numbers

  # rnorm
  rnorm(n, mean = 0, sd = 1)
  # Randomly generate n numbers that obey normal distribution
  # Default mean = 0, standard deviation = 1

  # sample
  sample(1:10, 4, replace = T)
  # Randomly pick 4 repeatable numbers from 1 to 10
  # Or replace = F
  ```
  > <small>**Functions in this block:** [`matrix`](#apx-matrix), [`rnorm`](#apx-rnorm), [`sample`](#apx-sample)</small>
###### 2.2.2.1.2 **Accessing** and **modifying** elements within a matrix

<a name="code24"></a>
```R
A <- matrix(1:10, nrow = 2)
A
# Returns
1 3 5 7  9
2 4 6 8 10

# Access the second row
A[2,] # Returns 2 4 6 8 10
# Access the second column
A[,2] # Returns 3 4
# Access the (2,2) element
A[2,2]  # Returns 4

# Modifying rows and columns
A[2,] <- c(as.numeric(paste(1, A[2,1:4], sep = '')), 20)
A[2,]
# Returns
12 14 16 18 20
# Modifying elements
A[1,1] <- 0
A[1,1]  # Returns 0

# Acquiring information on matrix
dim(A)  # Returns 2 5 (2 rows, 5 cols)
nrow(A) # Returns 2
ncol(A) # Returns 5
```
> <small>**Functions in this block:** [`matrix`](#apx-matrix), [`c`](#apx-c), [`as.numeric`](#apx-as.numeric), [`paste`](#apx-paste), [`dim`](#apx-dim), [`nrow`](#apx-nrow), [`ncol`](#apx-ncol)</small>
###### 2.2.2.1.3 **Calculation** of matrices

<a name="code25"></a>
```R
# Transposition
t(A)
# Returns
1  2
3  4
5  6
7  8
9 10

# Linear calculations
X <- matrix(1:4, nrow = 2)
Y <- matrix(5:8, nrow = 2)
X + Y # Addition
X - Y # Subtraction
X * Y # Must be same dimension as well
# Not Matrix Multiplication in Linear Algebra!
# But each element in X multiplied by corresponding element in Y
# Returns
1*5 3*7
2*6 4*8
# Namely
 5 21
12 32
X / Y # Similar to multiplication above

# Matrix multiplication (as in Linear Algebra)
X %*% Y # Multiplication
# Returns
23 31
34 46
```
> <small>**Functions in this block:** [`matrix`](#apx-matrix), [`multiplication`](#apx-multiplication)</small>
##### 2.2.2.2 Advance in Matrices
> Go [back](#222-matrices), go [down](#), or go to [top](#notes-on-r-learning).

###### 2.2.2.2.1 🚩 **Operation** on rows and cols

<a name="code26"></a>
```R
X <- matrix(1:4, nrow = 2)
Y <- matrix(5:8, nrow = 2)

# Sums and means
rowSums(X)  # Returns 25 30 (a 2D vector)
colSums(X)  # Returns 3 7 11 15 19 (a 5D vector)
mean(X) # Returns 5.5
rowMeans(X)
colMeans(X)

# 🚩 Binding of rows and cols
cbind(X,Y)  # Must with same nrow
# Returns (X,Y)
1 3 5 7
2 4 6 8
rbind(X,Y)  # Must with same ncol
# Returns (X,Y)^T
1 3
2 4
5 7
6 8
```
> <small>**Functions in this block:** [`matrix`](#apx-matrix), [`rowSums`](#apx-rowSums), [`colSums`](#apx-colSums), [`mean`](#apx-mean), [`rowMeans`](#apx-rowMeans), [`colMeans`](#apx-colMeans), [`cbind`](#apx-cbind), [`rbind`](#apx-rbind)</small>
###### 2.2.2.2.2 **Advance calculation** of matrices

<a name="code27"></a>
```R
# Inverse matrix 求逆
solve(X)
# Verify
round(solve(X) %*% X) # Returns I2

# SVD and pseudo-inverse 奇异值分解和求广义逆/伪逆
ginv(X) # Returns pseudo-inverse matrix
S <- svd(X)
# Stores vectors u, d and v (X = uD(v^T), where D = diag(d)) as a list
S$u %*% diag(S$d) %*% t(S$v) # Returns X (S$ extracts variants within S)

# Eigenvalue/eigenvector 特征值/特征向量
eigen(X)  # Returns eigenvalue and corresponding eigenvector

# diag
diag(X) # Returns the diagonal elements of X (a vector)
diag(n) # Returns In
diag(c(1,2))
# Returns
1 0
0 2
diag(2,4) # Returns 2*I4
diag(2,4,5) # Returns a 4*5 matrix with its first 4*4 submatrix being 2*I4
```
> <small>**Functions in this block:** [`solve`](#apx-solve), [`round`](#apx-round), [`ginv`](#apx-ginv), [`svd`](#apx-svd), [`diag`](#apx-diag), [`eigen`](#apx-eigen), [`c`](#apx-c)</small>
> `round` 取整. *e.g.*, `round(0.98)` returns `1`.
#### 2.2.3 **Arrays**
* **Arrays** are **multi-dim strings** of data **of a same type**
  * A matrix could be interpreted as a `2D` array, whereas a vector is `1D`
##### 2.2.3.1 Basics in Array
> Go [back](#223-arrays), go [down](#224-data-frames), or go to [top](#notes-on-r-learning).
###### 2.2.3.1.1 **Creating** arrays

<a name="code28"></a>
```R
# Creating array
array(data = NA, dim = c(2,3,4), dimnames = NULL)
# Returns a 2*3*4 array filled with NA and without dimnames

dimname_A <- c("A1","A2","A3")
dimname_B <- c("B1","B2","B3")
dimname_C <- c("C1","C2","C3")
Ω <- array(1:27, c(3,3,3), dimnames = list(dimname_A, dimname_B, dimname_C))
# if data doesn't fill the array size, then it will cycle
```
> <small>**Functions in this block:** [`array`](#apx-array), [`c`](#apx-c), [`list`](#apx-list)</small>
###### 2.2.3.1.2 **Accessing** elements within an array

<a name="code29"></a>
```R
print(Ω[3,1,2])  # Or Ω[3,1,2]
print(Ω[3,1,])  # Returns vector
print(Ω[3,,]) # Returns matrix

# Creating matrices from arrays
M(Ω) <- Ω[2,,]
```
> <small>**Functions in this block:** [`print`](#apx-print)</small>
#### 2.2.4 **Data frames**
* **Data frames** are data **forms** aligned in columns
  * A column has a **unique colname**
  * Columns are equal in **length**
  * Data within the same column must be **of the same type**
  * The type of data from **different** columns **can differ**
##### 2.2.4.1 Basics in Data frame
> Go [back](#224-data-frames), go [down](#225-lists), or go to [top](#notes-on-r-learning).
###### 2.2.4.1.1 **Creating** data frames

* Basic function

  <a name="code30"></a>
  ```R
  # Creating data frames
  data.frame(tag1 = vector1, tag2 = vector2, row.names = rname)
  ```
  > <small>**Functions in this block:** [`data.frame`](#apx-data.frame)</small>
  * `tag` is the colname
  * `row.names` defines rownames, default is `NULL`
* *e.g.*,

  <a name="code31"></a>
  ```R
  u <- c(1,2)
  v <- c(TRUE, FALSE)
  data.frame(u,v)
  # Returns
    u     v
  1 1  TRUE
  2 2 FALSE

  DF <- data.frame(
    'num' = c(1,2,3),
    'chr' = c("a","b","c"),
    'logi' = c(TRUE, FALSE, TRUE)
  )
  DF
  # Returns
    num chr  logi
  1   1   a  TRUE
  2   2   b FALSE
  3   3   c  TRUE
  ```
  > <small>**Functions in this block:** [`c`](#apx-c), [`data.frame`](#apx-data.frame)</small>
###### 2.2.4.1.2 **Accessing** and **modifying** elements within a data frame

<a name="code32"></a>
```R
# Acquiring overview and statistics on data frame
str(DF) # Returns data structure
summary(DF) # Returns statistic values of each column

# Accessing cols and rows
DF[,2]  # Returns the second col
DF$chr  # Returns the col with tag 'chr'
DF[1:2,]  # Returns the first and second rows
DF[1:2,1:2] # Returns
  num chr
1   1   a
2   2   b

# Adding cols
DF$'note' <- rep(NA,3)
DF
# Returns
  num chr  logi note
1   1   a  TRUE   NA
2   2   b FALSE   NA
3   3   c  TRUE   NA
```
> <small>**Functions in this block:** [`str`](#apx-str), [`summary`](#apx-summary), [`rep`](#apx-rep)</small>
###### 2.2.4.1.2 **Operation** on rows and cols

<a name="code33"></a>
```R
# rbind and cbind
DF
# Returns
  num chr  logi note
1   1   a  TRUE   NA
2   2   b FALSE   NA
3   3   c  TRUE   NA

DF1 <- data.frame('value' = c(3.14, 1.59, 2.65))
cbind(DF, DF1)
# Returns
  num chr  logi note value
1   1   a  TRUE   NA  3.14
2   2   b FALSE   NA  1.59
3   3   c  TRUE   NA  2.65

DF2 <- data.frame('num' = 4, 'chr' = "d", 'logi' = FALSE, 'note' = NA)
rbind(DF, DF2)
# Returns
  num chr  logi note
1   1   a  TRUE   NA
2   2   b FALSE   NA
3   3   c  TRUE   NA
4   4   d FALSE   NA
```
> <small>**Functions in this block:** [`data.frame`](#apx-data.frame), [`c`](#apx-c), [`cbind`](#apx-cbind), [`rbind`](#apx-rbind)</small>
#### 2.2.5 **Lists**
* **Lists** are containers of **different** types/structures of data
  * May include *data*, *vectors*, *matrices*, *arrays*, *data frames*, and even other *lists*.
##### 2.2.5.1 Basics in List
> Go [back](#225-lists), go [down](#2252-advance-in-list), or go to [top](#notes-on-r-learning).
###### 2.2.5.1.1 **Creating** lists

<a name="code34"></a>
```R
# Creating a list
List <- list(
  "revewill",
  "H",
  c(1,2,3),
  1.23,
  matrix(c(TRUE, FALSE, TRUE, TRUE), 2),
  list(
    c("a","b","c"),
    NA
  )
)
List
# Returns
[[1]] # [[1]] means the first item in the list
[1] "revewill"

[[2]]
[1] "H"

[[3]]
[1] 1 2 3

[[4]]
[1] 1.23

[[5]]
      [,1] [,2]
[1,]  TRUE TRUE
[2,] FALSE TRUE

[[6]]
[[6]][[1]]
[1] "a" "b" "c"

[[6]][[2]]
[1] NA

# Creating names for each element
names(List) <- c(
  "User",
  "Username",
  "Vector",
  "Number",
  "Matrix",
  "List"
)
List
# Returns
$User
[1] "revewill"

$Username
[1] "H"

$Vector
[1] 1 2 3

$Number
[1] 1.23

$Matrix
      [,1] [,2]
[1,]  TRUE TRUE
[2,] FALSE TRUE

$List
$List[[1]]
[1] "a" "b" "c"

$List[[2]]
[1] NA

# Or create names when creating the list
List <- list(
  'User' = "revewill",
  'Username' = "H",
  'Vector' = c(1,2,3),
  'Number' = 1.23,
  'Matrix' = matrix(c(TRUE, FALSE, TRUE, TRUE), 2),
  'list' = list(
    c("a","b","c"), 
    NA
  )
)
```
> <small>**Functions in this block:** [`list`](#apx-list), [`c`](#apx-c), [`matrix`](#apx-matrix), [`names`](#apx-names)</small>
###### 2.2.5.1.2 **Accessing** and **modifying** elements within a list

<a name="code35"></a>
```R
# Accessing the second item
List[2] # Returns [1] "H"
List$Username # Returns [1] "H"

# Modifying elements
List[2] <- "Huang"
List$Username <- "Huang"

# Deleting elements
List[-2]
# Or
List$Username <- NULL
```
###### 2.2.5.1.3 **Operation** on lists

<a name="code36"></a>
```R
L1 <- list(1:3)
L2 <- list(4:6)

# Merge lists
c(L1,L2)  # A new list with items in both lists

# Transform to vectors
L1 + L2 # Error!
V1 <- unlist(L1)
V2 <- unlist(L2)
V1 + V2 # Returns 5 7 9
```
> <small>**Functions in this block:** [`list`](#apx-list), [`c`](#apx-c), [`unlist`](#apx-unlist)</small>
##### 2.2.5.2 Advance in List
> Go [back](#225-lists), go [down](), or go to [top](#notes-on-r-learning).

<a name="code37"></a>
```R
List <- list(
  c(1,2,3),
  1
)

# Differences on [] and [[]]
List[1]
# Returns
[[1]]
[1] 1 2 3
# This itself is a list that only has one element: a vector

List[[1]]
# Returns
[1] 1 2 3
# This itself is the vector that is included in List

# Similar principles apply to data frames
DF <- data.frame(
  'num' = c(1,2)
  'chr' = c("a","b")
  'logi' = c(TRUE, FALSE)
)

DF[1]
# Returns
  num
1   1
2   2
# This itself is still a data frame

DF[[1]]
# Returns
[1] 1 2
# This is a vector, the source data of DF

DF[,1]
# Returns
[1] 1 2
# Extracting a column is extracting the corresponding vector
```
> <small>**Functions in this block:** [`list`](#apx-list), [`c`](#apx-c), [`data.frame`](#apx-data.frame)</small>
---
## 3. Data Management
### 3.1 **Importing** and **exporting** common files
> Go [back](#3-data-management), go [down](), or go to [top](#notes-on-r-learning).
#### 3.1.1 `csv` and `xlsx` files
> `csv` files use comma as separators to store forms. If a string contains comma, `csv` wraps it with `""`. For example, in `sample.csv`:

<a name="code38"></a>
```R
num,chr,logi
1,a,TRUE
2,b,FALSE
3,c,TRUE
4,d,FALSE
```
##### 3.1.1.1 **Reading** and **saving** `csv` files
> Go [back](#311-csv-and-xlsx-files), go [down](#3112-operation-on-xlsx-files), or go to [top](#notes-on-r-learning).

<a name="code39"></a>
```R
# Read
CSV_Data <- read.csv("sample.csv", encoding = "UTF-8")
CSV_Data
# Returns the following data frame
  num chr  logi
1   1   a  TRUE
2   2   b FALSE
3   3   c  TRUE
4   4   d FALSE

# Create subset
Subset <- subset(CSV_Data, chr == "b" | num == 3)
Subset
# Returns
  num chr  logi
2   2   b FALSE
3   3   c  TRUE

# Write Subset into a new .csv file
write.csv(Subset, "sample_subset.csv", row.names = FALSE)
read.csv("write.csv", enconding = "UTF-8")
```
> <small>**Functions in this block:** [`read.csv`](#apx-read.csv), [`subset`](#apx-subset), [`write.csv`](#apx-write.csv)</small>
##### 3.1.1.2 **Operation** on `xlsx` files
> Go [back](#311-csv-and-xlsx-files), go [down](#312-txt-files), or go to [top](#notes-on-r-learning).
* ※ Operation on `xlsx` files requires installing package `"xlsx"`:
  
  <a name="code40"></a>
  ```R
  install.packages("xlsx")
  library("xlsx")
  ```
  > <small>**Functions in this block:** [`install.packages`](#apx-install.packages), [`library`](#apx-library)</small>
* Operation:

  <a name="code41"></a>
  ```R
  # Read
  XLSX_Data <- read.xlsx("sample.xlsx", sheetIndex = 1)
  # Argument sheetIndex defines which sheet inside the file to read

  # Write
  write.xlsx(XLSX_Data, "samples.xlsx", sheetName = "new_sample", append = TRUE)
  # append = TRUE means that the created new sheet is in the original file after the last sheet in that file (追加)
  # append = FALSE means override (覆盖)
  ```
  > <small>**Functions in this block:** [`read.xlsx`](#apx-read.xlsx), [`write.xlsx`](#apx-write.xlsx)</small>
#### 3.1.2 `txt` files

<a name="code42"></a>
```R
#Read
TXT_Data <- read.table("sample.txt", header = TRUE, sep = "\t", row.names = 1, stringAsFactors = FALSE)
# header = TRUE means taking the first row as table header, = FALSE means otherwise
# sep = "\t" means the separator in .txt files is "\t"
# row.names = 1 means taking the first column as rownames
# stringAsFactors = FALSE means not transforming chr variables as factors, is default

# read.table function could also apply to csv files
read.table("sample.csv", sep = ",")

# Write
write.table(TXT_Data, "new_sample.txt", sep = "\t")
```
> <small>**Functions in this block:** [`read.table`](#apx-read.table), [`write.table`](#apx-write.table)</small>


# Apx. Cheatsheet

###### 1. <a name="apx-array"></a> `array` : [28](#code28)
<small>
</small>

###### 2. <a name="apx-as.character"></a> `as.character` : [19](#code19)
<small>
</small>

###### 3. <a name="apx-as.factor"></a> `as.factor` : [8](#code8)
<small>
</small>

###### 4. <a name="apx-as.integer"></a> `as.integer` : [6](#code6)
<small>
</small>

###### 5. <a name="apx-as.numeric"></a> `as.numeric` : [19](#code19) [24](#code24)
<small>
</small>

###### 6. <a name="apx-c"></a> `c` : [8](#code8) [9](#code9) [10](#code10) [11](#code11) [12](#code12) [13](#code13) [14](#code14) [16](#code16) [17](#code17) [18](#code18) [19](#code19) [22](#code22) [24](#code24) [27](#code27) [28](#code28) [31](#code31) [33](#code33) [34](#code34) [36](#code36) [37](#code37)
<small>
</small>

###### 7. <a name="apx-cbind"></a> `cbind` : [26](#code26) [33](#code33)
<small>
</small>

###### 8. <a name="apx-class"></a> `class` : [7](#code7)
<small>
</small>

###### 9. <a name="apx-colMeans"></a> `colMeans` : [26](#code26)
<small>
</small>

###### 10. <a name="apx-colnames"></a> `colnames` : [22](#code22)
<small>
</small>

###### 11. <a name="apx-colSums"></a> `colSums` : [26](#code26)
<small>
</small>

###### 12. <a name="apx-data.frame"></a> `data.frame` : [30](#code30) [31](#code31) [33](#code33) [37](#code37)
<small>
</small>

###### 13. <a name="apx-diag"></a> `diag` : [27](#code27)
<small>
</small>

###### 14. <a name="apx-dim"></a> `dim` : [24](#code24)
<small>
</small>

###### 15. <a name="apx-eigen"></a> `eigen` : [27](#code27)
<small>
</small>

###### 16. <a name="apx-factor"></a> `factor` : [8](#code8) [10](#code10)
<small>
</small>

###### 17. <a name="apx-getwd"></a> `getwd` : [3](#code3)
<small>
</small>

###### 18. <a name="apx-ginv"></a> `ginv` : [27](#code27)
<small>
</small>

###### 19. <a name="apx-gl"></a> `gl` : [9](#code9)
<small>
</small>

###### 20. <a name="apx-gsub"></a> `gsub` : [19](#code19)
<small>
</small>

###### 21. <a name="apx-install"></a> `install` : [1](#code1)
<small>
</small>

###### 22. <a name="apx-install.packages"></a> `install.packages` : [1](#code1) [40](#code40)
<small>
</small>

###### 23. <a name="apx-is.integer"></a> `is.integer` : [7](#code7)
<small>
</small>

###### 24. <a name="apx-is.numeric"></a> `is.numeric` : [7](#code7)
<small>
</small>

###### 25. <a name="apx-length"></a> `length` : [17](#code17)
<small>
</small>

###### 26. <a name="apx-library"></a> `library` : [2](#code2) [40](#code40)
<small>
</small>

###### 27. <a name="apx-list"></a> `list` : [22](#code22) [28](#code28) [34](#code34) [36](#code36) [37](#code37)
<small>
</small>

###### 28. <a name="apx-matrix"></a> `matrix` : [20](#code20) [21](#code21) [22](#code22) [23](#code23) [24](#code24) [25](#code25) [26](#code26) [34](#code34)
<small>
</small>

###### 29. <a name="apx-max"></a> `max` : [16](#code16)
<small>
</small>

###### 30. <a name="apx-mean"></a> `mean` : [16](#code16) [26](#code26)
<small>
</small>

###### 31. <a name="apx-median"></a> `median` : [16](#code16)
<small>
</small>

###### 32. <a name="apx-min"></a> `min` : [16](#code16)
<small>
</small>

###### 33. <a name="apx-multiplication"></a> `multiplication` : [25](#code25)
<small>
</small>

###### 34. <a name="apx-names"></a> `names` : [34](#code34)
<small>
</small>

###### 35. <a name="apx-nchar"></a> `nchar` : [19](#code19)
<small>
</small>

###### 36. <a name="apx-ncol"></a> `ncol` : [24](#code24)
<small>
</small>

###### 37. <a name="apx-nrow"></a> `nrow` : [24](#code24)
<small>
</small>

###### 38. <a name="apx-order"></a> `order` : [8](#code8) [16](#code16)
<small>
</small>

###### 39. <a name="apx-paste"></a> `paste` : [15](#code15) [24](#code24)
<small>
</small>

###### 40. <a name="apx-print"></a> `print` : [29](#code29)
<small>
</small>

###### 41. <a name="apx-prod"></a> `prod` : [16](#code16)
<small>
</small>

###### 42. <a name="apx-rbind"></a> `rbind` : [26](#code26) [33](#code33)
<small>
</small>

###### 43. <a name="apx-read.csv"></a> `read.csv` : [39](#code39)
<small>
</small>

###### 44. <a name="apx-read.table"></a> `read.table` : [42](#code42)
<small>
</small>

###### 45. <a name="apx-read.xlsx"></a> `read.xlsx` : [41](#code41)
<small>
</small>

###### 46. <a name="apx-rep"></a> `rep` : [11](#code11) [32](#code32)
<small>
</small>

###### 47. <a name="apx-rev"></a> `rev` : [16](#code16)
<small>
</small>

###### 48. <a name="apx-rm"></a> `rm` : [5](#code5)
<small>
</small>

###### 49. <a name="apx-rnorm"></a> `rnorm` : [23](#code23)
<small>
</small>

###### 50. <a name="apx-round"></a> `round` : [27](#code27)
<small>
</small>

###### 51. <a name="apx-rowMeans"></a> `rowMeans` : [26](#code26)
<small>
</small>

###### 52. <a name="apx-rownames"></a> `rownames` : [22](#code22)
<small>
</small>

###### 53. <a name="apx-rowSums"></a> `rowSums` : [26](#code26)
<small>
</small>

###### 54. <a name="apx-sample"></a> `sample` : [23](#code23)
<small>
</small>

###### 55. <a name="apx-seq"></a> `seq` : [11](#code11)
<small>
</small>

###### 56. <a name="apx-setwd"></a> `setwd` : [3](#code3)
<small>
</small>

###### 57. <a name="apx-solve"></a> `solve` : [27](#code27)
<small>
</small>

###### 58. <a name="apx-sort"></a> `sort` : [10](#code10) [16](#code16)
<small>
</small>

###### 59. <a name="apx-str"></a> `str` : [32](#code32)
<small>
</small>

###### 60. <a name="apx-strsplit"></a> `strsplit` : [19](#code19)
<small>
</small>

###### 61. <a name="apx-structure"></a> `structure` : [8](#code8)
<small>
</small>

###### 62. <a name="apx-subset"></a> `subset` : [39](#code39)
<small>
</small>

###### 63. <a name="apx-substring"></a> `substring` : [19](#code19)
<small>
</small>

###### 64. <a name="apx-sum"></a> `sum` : [16](#code16)
<small>
</small>

###### 65. <a name="apx-summary"></a> `summary` : [32](#code32)
<small>
</small>

###### 66. <a name="apx-svd"></a> `svd` : [27](#code27)
<small>
</small>

###### 67. <a name="apx-tolower"></a> `tolower` : [19](#code19)
<small>
</small>

###### 68. <a name="apx-toupper"></a> `toupper` : [19](#code19)
<small>
</small>

###### 69. <a name="apx-unlist"></a> `unlist` : [36](#code36)
<small>
</small>

###### 70. <a name="apx-var"></a> `var` : [16](#code16)
<small>
</small>

###### 71. <a name="apx-which.max"></a> `which.max` : [16](#code16)
<small>
</small>

###### 72. <a name="apx-which.min"></a> `which.min` : [16](#code16)
<small>
</small>

###### 73. <a name="apx-write.csv"></a> `write.csv` : [39](#code39)
<small>
</small>

###### 74. <a name="apx-write.table"></a> `write.table` : [42](#code42)
<small>
</small>

###### 75. <a name="apx-write.xlsx"></a> `write.xlsx` : [41](#code41)
<small>
</small>

