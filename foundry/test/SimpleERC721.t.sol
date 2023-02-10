// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
// import "forge-std/Vm.sol";
import "forge-std/console.sol";
import "../src/SimpleERC721.sol";

contract SimpleERC721Test is Test {
    SimpleERC721 public simpleERC721;

    function setUp() public {
        simpleERC721 = new SimpleERC721("Test", "TEST");
    }

    function testName() public {
        assertEq(simpleERC721.name(), "Test");
    }

    function testSymbol() public {
        assertEq(simpleERC721.symbol(), "TEST");
    }

    function testMintNft() public {
        assertEq(simpleERC721.balanceOf(address(1)), 0);
        vm.expectRevert("ERC721: invalid token ID");
        simpleERC721.ownerOf(1);
        vm.expectRevert("ERC721: invalid token ID");
        simpleERC721.tokenURI(1);

        vm.prank(address(1));
        simpleERC721.mintNft("image-url");

        assertEq(simpleERC721.balanceOf(address(1)), 1);
        assertEq(simpleERC721.ownerOf(1), address(1));
        simpleERC721.tokenURI(1);

        vm.prank(address(1));
        simpleERC721.mintNft("image-url");

        assertEq(simpleERC721.balanceOf(address(1)), 2);
        assertEq(simpleERC721.ownerOf(2), address(1));
        simpleERC721.tokenURI(2);
    }

    function testBurnNft() public {
        assertEq(simpleERC721.balanceOf(address(1)), 0);
        vm.expectRevert("ERC721: invalid token ID");
        simpleERC721.ownerOf(1);
        vm.expectRevert("ERC721: invalid token ID");
        simpleERC721.tokenURI(1);

        vm.prank(address(1));
        simpleERC721.mintNft("image-url");

        assertEq(simpleERC721.balanceOf(address(1)), 1);
        assertEq(simpleERC721.ownerOf(1), address(1));
        simpleERC721.tokenURI(1);

        vm.prank(address(1));
        simpleERC721.burnNft(1);

        assertEq(simpleERC721.balanceOf(address(1)), 0);
        vm.expectRevert("ERC721: invalid token ID");
        simpleERC721.ownerOf(1);
        vm.expectRevert("ERC721: invalid token ID");
        simpleERC721.tokenURI(1);
    }
}
