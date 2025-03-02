// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Token.sol";

contract NFTMarket {
    address owner;
    Token public nftContractAddress;

    constructor() {
        owner = msg.sender;
        nftContractAddress = new Token("Test", "TST", "http://localhost:8080/test");
    }


}
