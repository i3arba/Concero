// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ConceroTask} from "../src/ConceroTask.sol";

contract ConceroTaskScript is Script {
    function run() external returns(ConceroTask concero){
		
		vm.startBroadcast();
		
		concero = new ConceroTask();

		vm.stopBroadcast();
	}

}
