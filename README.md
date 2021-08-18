# Hello PBS

This repository includes a simple C code using the MPI library and a basic PBS
script.

It serves two purposes:

* To give a boilerplate to absolute beginners on running process in batch.
* For testing after server or queue maintenance.

## Building the binary

```shell
make clean && make build
```

This will create the `hello` binary.

## PBS submission script

```shell
#!/bin/bash

#PBS -N hello
#PBS -q remo_high
#PBS -l nodes=8:ppn=48
#PBS -j oe
#PBS -o output.txt
#PBS -l walltime=3:00

cd $PBS_O_WORKDIR

mpiexec ./hello
```

This will submit a job with the name *hello*, to the queue *remo_high*,
requiring 8 *nodes* and 48 *cpus* for each node.

Both the *standard output* and the *error output* will be written to the same
file, `output.txt`.

Finally, the *walltime* will be set to 3 minutes. That means if my job takes
more than 3 minutes to run, it will be preempted after that time.
