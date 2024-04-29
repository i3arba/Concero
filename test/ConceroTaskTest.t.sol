// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ConceroTask} from "../src/ConceroTask.sol";
import {ConceroTaskScript} from "../script/ConceroTaskScript.s.sol";

contract ConceroTaskTest is Test {
    ConceroTask public concero;
    ConceroTaskScript public script;

    function setUp() public {
        script = new ConceroTaskScript();
        concero = script.run();
    }

}
