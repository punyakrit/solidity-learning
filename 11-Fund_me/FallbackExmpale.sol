//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


// fallback and receive are special functions used to handle Ether transfers and non-matching function calls. They’re often used in contracts that want to accept ETH or handle low-level calls.
// a function can have at most 1 recieve function

contract FallBackExmaple{
    uint256 public result;

    receive() external payable { // it is triggered if no data is sent in transaction
        result = 1;
    }

    fallback() external payable{ // calling contract with data but no valid function
        result = 2;
    }
}