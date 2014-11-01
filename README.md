# docker-basho-bench

Docker containers to run Basho Bench easily

These are base Dockerfiles that you can use to easily run Basho Bench against your cluster.

## Benchmark

This is the basis for running your own benchmark. You can either run it ad-hoc, or base your own Dockerfile off of it and add your configuration files to that directly.

### Usage

`docker run -it -v /my/benchmarks:/app basho-bench-run basho_bench /app/test.config`

This will mount your folder with your benchmark configurations to the `/app` directory in the container and run `basho_bench` against your chosen config. Raw results will then be available to you in `/my/benchmark/tests`.

## Results

This will generate the `summary.png` chart from the raw benchmarks. You'll need to mount the same directory that you used to run the benchmark originally.

### Usage

`docker run -it -v /my/benchmarks/tests:/app/tests basho-bench-results`
