// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFive is SimpleStorage {
    // this contract has all the properties of simplestorage 
    function store(uint256 _favNumber ) public override {
         myFavNumber = _favNumber+5;
    }
}