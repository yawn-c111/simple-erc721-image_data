// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "../src/SimpleERC721.sol";

contract SimpleERC721Script is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        SimpleERC721 simpleERC721 = new SimpleERC721("Test", "TEST");

        vm.stopBroadcast();
    }
}
