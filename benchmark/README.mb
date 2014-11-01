## Benchmark

This is the basis for running your own benchmark. You can either run it ad-hoc, or base your own Dockerfile off of it and add your configuration files to that directly.

### Usage

`docker run -it -v /my/benchmarks:/app shopkeep/basho-benchmark basho_bench /app/test.config`

This will mount your folder with your benchmark configurations to the `/app` directory in the container and run `basho_bench` against your chosen config. Raw results will then be available to you in `/my/benchmark/tests`.
