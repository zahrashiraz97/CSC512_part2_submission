# Detection of Seminal Input Features in C Programs Using LLVM

## Objective

The main objective of this project is to create a static analysis tool utilizing LLVM to identify seminal input features within C programs. These features are critical parts of the input that significantly affect the program's behavior at essential execution points.

## Conceptual Framework

Our strategy for addressing the detection of seminal input features in C programs comprises the following key steps:

1. **Development of a Comprehensive Def-Use Chain**: We aim to create a system that effectively tracks the definition and usage relationships of variables across the program. This tracking is vital for understanding the interactions between different variables and the program's overall execution flow. We will represent these relationships using an adjacency list constructed with a hashmap.

2. **Detection of Loop Termination Variables**: Our analysis will focus on identifying the specific variables that control the termination of loops by examining the conditions that dictate loop execution and the variables influencing these conditions.

3. **Exploration of Calling Relationships in Global Functions**: We will analyze the global context to uncover the calling relationships between user input variables and other program variables, which is essential for linking user inputs to their effects on program behavior.

4. **Correlation of IO Variables with Loop Termination Variables**: By employing a hashmap, we will match which input/output variable governs the loop termination variable, establishing a connection between user inputs and critical program execution points.

5. **Reporting Target Variables and Corresponding Line Numbers**: In the final step, we will produce a clear output highlighting the identified seminal input features, specifically the target variable along with its line number in the source code.

## Prerequisites

> **Important:**  
> It is recommended to use a **clean** VCL VM for this setup to avoid potential issues stemming from LLVM version discrepancies or installation methods.

> **Tip:**  
> If you are using Ubuntu, you can automatically install the required components by running `make prereq` (you may need to press <kbd>Enter</kbd> to accept the LLVM license agreement). For further details, consult the [`Makefile`](./Makefile).

- LLVM version 16.0 or later installed (`./scripts/ubuntu-llvm.sh`)
- CMake installed (`sudo apt install cmake -y`)
- A C++ compiler (e.g., g++, clang)

### Third-party Libraries

Please install the following libraries and update your include paths in `BranchPointerPass/CMakeLists.txt`:

- [nlohmann-json](https://github.com/nlohmann/json)

## Building the Pass

If you haven't already, begin by cloning the repository:

```bash
git clone https://github.com/ncsu-csc512-project/part2-submission.git
```

Next, navigate to the root directory of the repository and execute the following commands to build the pass:

```bash
mkdir build
cd build
cmake ..
make
```

### Running the tests

```bash
clang  -g -O0 -emit-llvm -c test_example1.c -o test_example1.bc
llvm-dis test_example1.bc -o test_example1.ll
opt -load-pass-plugin ../build/libDefUseAnalysisPass.so -passes=def-use-analysis -disable-output test_example1.bc

clang  -g -O0 -emit-llvm -c hash_blake2b.c -o hash_blake2b.bc
llvm-dis hash_blake2b.bc -o hash_blake2b.ll
opt -load-pass-plugin ../build/libDefUseAnalysisPass.so -passes=def-use-analysis -disable-output hash_blake2b.bc



./run_tests.sh
```

### Example tests
1. Example 1
```bash
#include <stdio.h>
int main(){
   int id;
   int n;
   scanf("%d", &n);
   int s = 0;
   id = n;
   for (int i = 0; i < id; i++){
      s += 1;
   }
   printf("id=%d; sum=%d\n", id, n);
}

```

2. Example 2

```bash
#include <stdio.h>

int main() {
    char str1[1000]; 
    FILE *fp = fopen("file.txt", "r"); 
    char c;
    int len = 0;
    if (fp == NULL) {
        printf("Failed to open file\n");
        return 1;
    }
    while (1) {
        c = getc(fp);
        if (c == EOF || len >= 999) break;
        str1[len++] = c;
    }
    str1[len] = '\0'; 
    printf("%s\n", str1);
    fclose(fp); 
    return 0;
}
```

### Test Output
Output for example 1
```bash
Seminal Input Feature: Key variable: n, Line: 4
```
Output for example 2
```bash
Seminal Input Feature: Key variable: fp, Line: 5
```



