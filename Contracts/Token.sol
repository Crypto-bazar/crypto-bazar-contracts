// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Token is ERC721, Ownable {
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIdCounter;  // Счетчик токенов
    string private _baseTokenURI;  // Базовый URI для метаданных

    constructor(string memory name, string memory symbol, string memory baseURI) ERC721(name, symbol) Ownable(msg.sender) {
        _baseTokenURI = baseURI;
    }

    // Функция для минтинга нового NFT
    function mintNFT(address to) public onlyOwner returns (uint256) {
        _tokenIdCounter.increment();
        uint256 newTokenId = _tokenIdCounter.current();
        _safeMint(to, newTokenId);
        return newTokenId;
    }

    function transferToken(address _from, address _to) public {
        transferFrom(_from, _to, 1);
    }

    // Установка базового URI (если нужно менять)
    function setBaseURI(string memory baseURI) public onlyOwner {
        _baseTokenURI = baseURI;
    }

    function getBalance() public view returns(uint256) {
        return balanceOf(msg.sender);
    }

    // Переопределение функции baseURI
    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    function getTokenUri() public view returns(string memory) {
        return _baseTokenURI;
    } 
}
