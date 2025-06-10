//SPDX-License-Identifier: MIT
// pragma solidity ^0.6.0;
pragma solidity ^0.8.18;

contract SafeMath{
    uint8 public number = 255;
    // in here in version 6.0 there was safe math if it reaches higher limit of a numberlike 255 on function call it would again start from 0
    // but in case of newer versions now if it reaches it higher limit the trasaction revertes eg

    function addUp() public{
    //    number =  number+1;
    unchecked{ number =  number+1;} // unchecked added in this syntax would allow this propert to go beyond and it even help as it reduces gas fee usage also

    }
}