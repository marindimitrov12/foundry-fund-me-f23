// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Script}from "forge-std/Script.sol";
import {DevOpsTools}from "foundry-devops/src/DevOpsTools.sol";
import {FundMe}from"../src/FundMe.sol";
contract FundFundMe is Script{
   uint256 constant SEND_VALUE=0.01 ether;
   function fundFundMe(address mostRecentDeployed)public{
     
     FundMe(payable(mostRecentDeployed)).fund{value:SEND_VALUE}();
    
   }

   function run() external{
   
      address  mostRecentDeployed=DevOpsTools.get_most_recent_deployment("FundMe",block.chainid);
       vm.startBroadcast();
      fundFundMe(mostRecentDeployed);
       vm.stopBroadcast();
   }
}
contract WithdrawFundMe is Script{
   uint256 constant SEND_VALUE=0.01 ether;
   function withdrawFundMe(address mostRecentDeployed)public{
     
     FundMe(payable(mostRecentDeployed)).withdraw();
    
   }

   function run() external{
   
      address  mostRecentDeployed=DevOpsTools.get_most_recent_deployment("FundMe",block.chainid);
       vm.startBroadcast();
      withdrawFundMe(mostRecentDeployed);
       vm.stopBroadcast();
   }
}