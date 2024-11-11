// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/Director.sol";

contract GoScript is Script {
    //Counter public counter;

    Director public director;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        director = new Director(0xF11f8301C76F46733d855ac767BE741FFA9243Bd);

        vm.stopBroadcast();
    }
}
