// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract functions{
    uint favNo;


// store function is not reading its updating to the blockchain making a transaction

    function store(uint256 _favNo) public {
            favNo = _favNo;
    }

        //  a function marked "view" is just oging to read state from the blockchain 
        // view disallows any modification to the state
        // a function marked "pure" disallowes updating and even reading from the state
    function getFav() public view returns(uint256) {
        return favNo;
    }

    function getPure() public pure returns(uint256) {
        return 9;
    }
    
}