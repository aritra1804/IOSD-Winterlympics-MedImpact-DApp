// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
  

contract MedicalManagmtSys{
    struct Medical
    {
        int ID;
        string Name;
        string Problem;
        int Fees;
    }
  
    address owner;
    int public mdcCount = 0;
    mapping(int => Medical) public mdcRecords;
  
    modifier onlyOwner
    {
        require(owner == msg.sender);
        _;
    }
    constructor()
    {
        owner=msg.sender;
    }
  
    function addNewRecords(int _ID, 
                           string memory _Name,
                           string memory _Problem,
                           int _Fees) public onlyOwner
    {
        // Increase the count by 1
        mdcCount = mdcCount + 1;
  
        
        mdcRecords[mdcCount] = Medical(_ID, _Name, 
                                       _Problem, _Fees);
    }
  
    // Create a function to add bonus Fees 
    function bonusFees(int _bonus) public onlyOwner
    {
         mdcRecords[mdcCount].Fees = 
                    mdcRecords[mdcCount].Fees + _bonus;
    }
}