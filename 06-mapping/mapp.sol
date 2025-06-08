// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract mapper{
    // in mapping default values of all the keys is 0 if output is uint256
    mapping(string => uint256) public nameToNumber;
    
    uint256 myFavNumber;

    struct Person{
        string name;
        uint256 favNumber;
    }

    Person[] public listOfPeople;

    function addPerson(string memory _name, uint256 _favNumber ) public {
        listOfPeople.push(Person(_name, _favNumber));
        nameToNumber[_name] = _favNumber;
    }

    function retrieve() public view returns(uint256){
        return  myFavNumber;
    }
}