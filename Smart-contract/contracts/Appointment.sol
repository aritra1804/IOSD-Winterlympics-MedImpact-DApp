// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract appointment{
    address public owner;
    mapping(address => uint) public noofappointments;

    constructor() {
        owner = msg.sender;
        noofappointments[address(this)] = 30;
    }

    function appointleft() public view returns (uint) {
        return noofappointments[address(this)];
    }

    function appointdone(uint noofdone) public{
        require(msg.sender == owner, "Only Doctors can add this info");
        noofappointments[address(this)] += noofdone;
    }

    function appointbook(uint noofappoint) public payable{
        require(msg.value >= noofappoint*1 ether, "You must pay 1 ether for each appointment");
        require(noofappointments[address(this)] >= noofappoint);
        noofappointments[address(this)] -= noofappoint;
        noofappointments[msg.sender] += noofappoint;
    }
}