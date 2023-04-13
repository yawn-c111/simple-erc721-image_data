// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/utils/Base64.sol";

contract SimpleERC721 is ERC721 {
    uint256 public _tokenId;

    mapping(uint256 => string) private _tokenURIs;

    constructor(
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {}

    function mintNft(string memory imageJson) public {
        uint256 tokenId = ++_tokenId;
        _safeMint(msg.sender, tokenId);
        _tokenURIs[tokenId] = string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(
                    abi.encodePacked(
                        '{"description": "',
                        name(),
                        '", "image_data": "',
                        imageJson,
                        '", "name": "',
                        name(),
                        " #",
                        Strings.toString(tokenId),
                        '"}'
                    )
                )
            )
        );
    }

    function burnNft(uint256 tokenId) public {
        require(msg.sender == ownerOf(tokenId));
        _burn(tokenId);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        _requireMinted(tokenId);
        string memory _tokenURI = _tokenURIs[tokenId];
        return _tokenURI;
    }
}
