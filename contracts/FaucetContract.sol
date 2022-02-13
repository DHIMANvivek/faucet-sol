// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Faucet{
// uint256 public funds = 1000; // positive always
// int public counter = -10; 
// uint32 public test = 4294967295;
uint public numOfFunders;

mapping(address => bool) public funders;
mapping(uint => address) private lutFunders;


receive() external payable{}

modifier limitWithdraw(uint withdrawAmount){
 require(
     withdrawAmount < 2000000000000000000,
 "can't ,ore then 2000000000000000000"
 );
 _;
}

function addFunds() external payable{
 uint index = numOfFunders++;
 address funder = msg.sender;
 if(!funders[funder]){
    numOfFunders++;
     funders[funder]  = true;
     lutFunders[index] = funder;
 }
 } 

 function withdraw(uint withdrawAmount) external limitWithdraw(withdrawAmount){
    //  require(withdrawAmount < 2000000000000000000,"can't ,ore then 2000000000000000000");
    //  if(withdrawAmount < 2000000000000000000){
    //   payable(msg.sender).transfer(withdrawAmount);
    //  }
      payable(msg.sender).transfer(withdrawAmount);
  }
//instance.addFunds({from: accounts[1],value: "1000000000000000000"})
//instance.withdraw("500000000000000000",{from: accounts[1]})
//const instance = await Faucet.deployed()
 function getAllFunders() external view returns(address[] memory){
     address[] memory _funders = new address[](numOfFunders);

     for(uint i = 0 ; i < numOfFunders ; i++){
         _funders[i] = lutFunders[i];
     }

     return _funders;

 }

function getFunderAtIndex(uint8 index) external view returns(address){
    // address[] memory _funders = this.getAllFunders();
    return lutFunders[index];
} 


// function getAllFunders() public view  returns(address[] memory){
// return funders;
// }




// const instance = await Faucet.deployed()
// instance.addFunds({from: accounts[0] , value: 2})


}


