// Get Funds form user, withdraw funds and allowing to give minimum usd in funds

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe {

    uint256 public minimumUsd = 5e18;

    address[] public funders;

    mapping(address => uint256) public accountSentMoney;

    //payable keyword make user send money in this function
    function fund() public payable { // this function will allow users to send money
        // require states if this satisfys transction then ok otherwise reverts transaction but you will still spend gas
        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enought eth");
        funders.push(msg.sender);
        accountSentMoney[msg.sender] = accountSentMoney[msg.sender] + msg.value;
    }

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price, , ,)= priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/ 1e18;
        return ethAmountInUsd;
    }

    function withdraw() public {

    }
}