// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage{
    
    uint256 myFavNumber;

    mapping(string => uint256) public nameToNumber;
    

    struct Person{
        string name;
        uint256 favNumber;
    }

    Person[] public listOfPeople;

    function store(uint256 _favNumber1) public {
        myFavNumber = _favNumber1;
    }

    function addPerson(string memory _name, uint256 _favNumber ) public {
        listOfPeople.push(Person(_name, _favNumber));
        nameToNumber[_name] = _favNumber;
    }

    function retrieve() public view returns(uint256){
        return  myFavNumber;
    }
}