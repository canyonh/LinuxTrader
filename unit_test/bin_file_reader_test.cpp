#include <gtest/gtest.h>
#include "bin_file_reader.h"

namespace UnitTest
{

class BinFileReaderTest : public testing::Test
{
protected:
    BinFileReaderTest()
    {

    }
    ~BinFileReaderTest() override
    {

    }
    
    void SetUp() override
    {

    }

    void TearDown() override
    {

    }

};

TEST_F(BinFileReaderTest, ReadFile)
{
    UnitTest::ReadItchDump("data/01302019.NASDAQ_ITCH50");
}

}
