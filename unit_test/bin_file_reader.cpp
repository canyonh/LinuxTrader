#include <array>
#include <fstream>
#include "bin_file_reader.h"

namespace UnitTest
{

bool ReadItchDump(const char* file_name_in)
{
    std::ifstream dump_file(file_name_in, std::ios::in|std::ios::binary);
    if (dump_file.is_open())
    {
        return false;
    }

    while (!dump_file.eof())
    {
        std::array<std::byte, 2> payload_length_buffer;
        dump_file.read(reinterpret_cast<char*>(&payload_length_buffer[0]), sizeof(payload_length_buffer));
        if (dump_file.gcount() != 2)
        {
            return false;
        }

        uint16_t payload_length = ((uint16_t)payload_length_buffer[0] << 8) | (uint16_t)payload_length_buffer[1];
        std::cout << "payload length: " << payload_length << std::endl;
    }
    
    return true;
}

};
