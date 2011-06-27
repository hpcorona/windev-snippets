// Creates a 8-byte unsigned integer
// Mixing two integers
// The first integer will take 2 bytes
// The second integer will take 6 bytes
PROCEDURE MakeKey(IDSection, IDAuto)

ID1 is 8-byte unsigned int = IDSection
ID2 is 8-byte unsigned int = IDAuto

ID3 is 8-byte unsigned int

ID3 = (ID1 bitLeftShift 48) + ID2

RESULT ID3


// Takes an 8-byte unsigned integer
// and decomposes into two integers
// (reverting from the MakeKey function)
PROCEDURE RevertKey(ID, IDSection, IDAuto)

IDSection = ID bitRightShift 48
IDAuto = BinaryAND(ID, 0xffffffffffff)
