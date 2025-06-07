// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract arraysone {
    // uint256 [] listOfNumbers;

    struct Person{
        uint256 favNumber;
        string name;
    }
    // if in array it is mentioned [2] then it is static array if not [] it is dynamic array

    Person[] public listOfPeople;

    function addPerson(string memory _name, uint256 _favnumber) public {
        // Person memory tempPerson = Person(_favnumber,_name);
        // listOfPeople.push(tempPerson);
        // this is valid but we could also do this 
        
        listOfPeople.push(Person(_favnumber,_name));
    }

    // Person public abc = Person({
    //     favNumber : 10,
    //     name : "Abc"
    // });
    // Person public bcs = Person({
    //     favNumber : 10,
    //     name : "Abefefc"
    // });
    // Person public wdjn = Person({
    //     favNumber : 10,
    //     name : "wd"
    // });
}