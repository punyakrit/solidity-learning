// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract mem {
    //  Calldata and memory both mean that the variable is oging to exist temporarily
    //  it is gogin to exist until the function call

    function adData(string memory _name) public {
        // in memory the _name can be changed manipulated inside the function call
        _name = "hi";
    }

    function adData1(string calldata _name) public {
        // _name= "ajsn";
        // this cannot compile as calldata is defined here and cannot be modified
    }

    // these both means temp vairables


    // stuct ,mapping , arrays need to be given memory keyword
    // string is array of bytes so it needs memory there
}
