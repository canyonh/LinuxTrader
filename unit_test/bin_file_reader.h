#ifndef BIN_FILE_READER_H_
#define BIN_FILE_READER_H_

#include <vector>
#include <iostream>

namespace UnitTest
{
    struct Record
    {
        std::vector<char> payload;
    };

    void LoadRecord(const char* file_name_in, std::vector<Record>& records_out);
};

#endif
