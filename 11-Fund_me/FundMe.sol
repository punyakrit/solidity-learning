// Get Funds form user, withdraw funds and allowing to give minimum usd in funds

// the current gas to deploy this smart contract is too high to optimise this few basic things are while declaring values to store are constant and immutable keywords so its values cant be changed


//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { PriceConvertor } from './PriceConvertor.sol';

error notOwner();

contract FundMe {

    using PriceConvertor for uint256;

    uint256 public constant MINIMUM_USD = 5e18; // this with constant wont take upa storage spot there name are mostly in caps

    address[] public funders;

    mapping(address => uint256) public accountSentMoney;

    address public immutable i_owner; // it is immutable as its value is not declared in same line and its variable also starts withi_owner

    // this constructor is immediately called whenever this contract is deployed
    constructor(){
        i_owner = msg.sender;
    }




    //payable keyword make user send money in this function
    function fund() public payable { // this function will allow users to send money
        // require states if this satisfys transction then ok otherwise reverts transaction but you will still spend gas

        // in this library used getConversionRate its first function parameter is directly taken from msg.value.getConversionRate() and second parameter would be after (20); or something else
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enought eth");
        
        funders.push(msg.sender);
        accountSentMoney[msg.sender] += msg.value;
    }

    

    function withdraw() public onlyOwner(){


        for(uint256 i =0; i<funders.length; i++){
            address funderUser = funders[i];
            accountSentMoney[funderUser] = 0; 
        }

        funders = new address[](0);

        //1st way is to transfer 
        //send money from contracts to each other
            // payable(msg.sender).transfer(address(this).balance); // if this line fails it will rever the transaction
        //Gas Limit: Forwards 2300 gas to the recipient (enough to log an event but not enough to run complex logic).
        // Reverts on failure: Yes (throws error if the transfer fails).
        //  Recommended for: Simple transfers where you don’t expect the recipient to have any fallback logic.
        // Security: Safer due to automatic revert and low gas.


        // 2nd way send

        // bool sendCheck = payable(msg.sender).send(address(this).balance);
        // require(sendCheck,"Send failed");

        //Gas Limit: Forwards 2300 gas, like transfer.
        // Reverts on failure: No – returns false if the transfer fails.
        // You must check the return value manually.
        // Recommended for: Rarely used due to lack of automatic error handling.


        // 3rd way call - is powerfull can be used to call any function in eth with having abi

        (bool callCheck, ) = payable(msg.sender).call{value:address(this).balance}("");
        require(callCheck,"Call failed");


    }

// modifier is type of middleware to add a functionality to a function in its decleration
    modifier onlyOwner(){
        // -> require actually takes up a lot of gas it store a string in lot of bytes in there 
        if(msg.sender != i_owner){
            revert notOwner(); // this ends up saving a lot of gas
        }

        // require(msg.sender == i_owner, "must be owner");
        _; // this means after the above code comes the rest of the fucntion logic 
        // if this "_;" is above then whole function code comes at top and then comes the require statement

    }
}