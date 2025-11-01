// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract ExampleMapping{
    mapping (address => uint) public balanceRecieved;

    function sendMoney() public payable {
        balanceRecieved[msg.sender] += msg.value;
    }

    function getbalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawAll(address payable _to) public {
        uint depositedvalue = balanceRecieved[msg.sender];
        balanceRecieved[msg.sender] = 0;
        _to.transfer(depositedvalue);
    }
}
