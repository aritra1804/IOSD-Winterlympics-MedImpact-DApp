// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
  

contract Medicine{
    struct Patient
    {
        int ID;
        string contactno;
        string Name;
        string MedicineName;
        string Reference;
        string Date;
        int Quantity;
        int Total;
    }
  
    address owner;
    int public stdCount = 0;
    mapping(int => Patient) public stdRecords;
  
    modifier onlyOwner
    {
        require(owner == msg.sender);
        _;
    }
    constructor()
    {
        owner=msg.sender;
    }
  
    // Create a function to add 
    // the new records
    function addNewRecords(int _ID, 
                           string memory _Name,
                           string memory _contactno,
                           string memory _Reference,
                           string memory _MedicineName,
                           string memory _Date,
                           int _Quantity,
                           int _Total) public onlyOwner
    {
        // Increase the count by 1
        stdCount = stdCount + 1;
  
        // Fetch the student details 
        // with the help of stdCount
        stdRecords[stdCount] = Patient(_ID, _Name, _contactno, _Reference, _MedicineName, _Date, _Quantity, _Total);
    }
}