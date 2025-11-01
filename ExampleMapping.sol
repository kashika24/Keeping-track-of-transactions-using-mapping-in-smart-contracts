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

    //to transfer only limited balance, less than or equal to what is available
     function withdrawAmount(address payable _to, uint _amount)public {
        require(_amount<=balanceRecieved[msg.sender], "not enough funds!");
        balanceRecieved[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function withdrawAll(address payable _to) public {
        uint depositedvalue = balanceRecieved[msg.sender];
        balanceRecieved[msg.sender] = 0;
        _to.transfer(depositedvalue);
    }
}
