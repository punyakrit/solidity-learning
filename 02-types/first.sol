//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // or can use  >=0.8.18 <0.9.0

contract first{

    // by default values inuint is 0
    // bool is false
    
    bool favNumber = true;
    
    uint numberisoo = 88;   // Maximum it can got to unit256 but if not defined
                            // by default its value is 256
    
    uint256 numberis = 88; // 256 bits explicit how many bits are using
    
    int256 intNumber = -88;


    string text = "80"; //string are secretly bytes object specifically for text 

    address muAddress = 0x5A2D9361b0B9eE704aa05b6BDeCdBF75ce239674;

    bytes32 fav = "abc"; // bytes with nothing by default  and 32 are different 

}