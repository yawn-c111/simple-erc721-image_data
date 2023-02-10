// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Script.sol";
import "../src/SimpleERC721.sol";

contract SimpleERC721Script is Script {
    function setUp() public {}

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        SimpleERC721 simpleERC721 = new SimpleERC721("Test", "TEST");

        vm.stopBroadcast();
    }
}
