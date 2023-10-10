
#include <cstdint>
#include <benchmark/benchmark.h>


static void Test(benchmark::State& state)
{
    uint64_t val = 0;
    for(size_t i = 0; i < 10000; ++i)
    {
        val++;
    }
    return;
}

BENCHMARK(Test);
BENCHMARK_MAIN();

