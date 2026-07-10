# Containers-BinaryIndexedTree

A high-performance **Binary Indexed Tree** (Fenwick Tree) for Pharo that supports point updates and prefix-sum queries in worst-case O(log N) time while using O(N) contiguous array storage.

![Pharo 14+](https://img.shields.io/badge/Pharo-14%2B-informational) ![License MIT](https://img.shields.io/badge/License-MIT-success)

---

## What is a Binary Indexed Tree?

In a standard array, updating an element is $O(1)$, but calculating a prefix sum (the sum of elements from index 1 to $i$) requires scanning the array, resulting in an $O(N)$ penalty. If you pre-calculate the sums in a separate array, the query becomes $O(1)$, but updating a single value requires recalculating the rest of the array, taking $O(N)$ time.

A **Binary Indexed Tree** (BIT) bridges this gap by representing the sums as a logical tree built implicitly inside a flat array. By leveraging fast bitwise operations to isolate the least significant bit (LSB), it jumps across indices to maintain partial sums, guaranteeing $O(\log N)$ complexity for both updates and queries without the overhead of heavy tree node allocations.

---

## Loading

To install `Containers-BinaryIndexedTree`, open the Playground (`Ctrl + O + W`) in your Pharo image and execute the following Metacello script:

```smalltalk
Metacello new
  baseline: 'ContainersBinaryIndexedTree';
  repository: 'github://pharo-containers/Containers-BinaryIndexedTree/src';
  load.
```

### If you want to depend on it

Add the following snippet to your own Metacello baseline:

```smalltalk
spec
  baseline: 'ContainersBinaryIndexedTree'
  with: [ spec repository: 'github://pharo-containers/Containers-BinaryIndexedTree/src' ].
```

---

## Basic Usage

```smalltalk
"Initialize a BIT of size 10"
bit := CTBinaryIndexedTree new: 10.

"Add a value to a specific index in O(log N)"
bit add: 5 at: 1.
bit add: 3 at: 2.
bit add: 7 at: 3.

"Query the prefix sum up to an index in O(log N)"
bit prefixSum: 3. "=> 15"

"Query a specific range sum in O(log N)"
bit rangeSumFrom: 2 to: 3. "=> 10"

"Read and absolute-write values directly"
bit at: 2.         "=> 3"
bit at: 2 put: 10. "Updates the value from 3 to 10"
```

You can also build the tree efficiently from an existing collection in **$O(N)$** time:

```smalltalk
bit := CTBinaryIndexedTree new.
bit buildFrom: #(10 20 30 40 50).
```

---

## Time & Space Complexity

| Operation | Time Complexity | Space Complexity (Allocations) |
| :--- | :--- | :--- |
| `buildFrom:` | $O(N)$ | $O(N)$ |
| `add:at:` | $O(\log N)$ | $O(1)$ |
| `prefixSum:` | $O(\log N)$ | $O(1)$ |
| `rangeSumFrom:to:` | $O(\log N)$ | $O(1)$ |
| `at:put:` | $O(\log N)$ | $O(1)$ |
| **Memory footprint** | | **$O(N)$ Continuous Array** |

---

## Performance & Empirical Proof

Benchmarks measure the core update and query operations in isolation. By utilizing a flat array and removing the need for `Node` instantiation, the garbage collection (GC) overhead of the data structure remains securely at **~0.00%**. 

*(Empirical data gathered running 1,000,000 operations per suite in Pharo 14)*

| Workload | Execution Time (µs) | GC Penalty |
| :--- | :--- | :--- |
| **Addition Stress Test** | 121,145 µs | 0.00 % |
| **Prefix Query Stress Test** | 86,430 µs | 0.00 % |
| **High-Frequency Tick Simulation*** | 3,232,547 µs | 1.13 % |
| **Dynamic Leaderboard Simulation*** | 680,977 µs | 0.74 % |


**Conclusion:** The bitwise isolated jumps allow millions of mixed read/write operations to execute with minimal memory pressure on the VM.

---

## Contributing

This library is part of the [Pharo Containers](https://github.com/pharo-containers) project. Contributions are welcome, whether implementing additional functional combinators, improving test coverage, or enhancing documentation. Please open an issue or pull request on GitHub.