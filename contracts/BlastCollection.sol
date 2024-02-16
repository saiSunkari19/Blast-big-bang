// SPDX-License-Identifier: MIT
pragma solidity  0.8.18;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Royalty.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


    /**
     * @dev Deploying AutoNFT contract with NFT Presets.
     */
contract BlastCollection is  ERC721URIStorage, ERC721Enumerable, ERC721Pausable, ERC721Burnable, ERC721Royalty, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

  
    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     *  Name and symbol for contract
     * 1% Royality as default
     */
    constructor (string memory name, string memory symbol) ERC721(name, symbol)  {
        setDefaultRoyality(msg.sender,100);
    }

    /**
     * @dev safeMint used to mint as NFT.
     */
    function safeMint(address to, string memory uri) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
    
    // function transferTokens() public onlyRole(AUTON_ADMIN_ROLE){
    //     uint256 contractBalance = address(this).balance;
    //     require(contractBalance > 0, "Contract has no  balance");
    //     auton_admin.transfer(contractBalance);
    // }

    /**
     * @dev Pause the contract by Owner
     */    
    function pause() public  onlyOwner {
        _pause(); 
    }

    /**
     * @dev UnPause the contract by Owner
     */   
    function Unpause() public onlyOwner {
        _unpause();
    }

    /**
    * @dev Set Royalities Info
    * Royalities base points with denominator of 10,000 points 
    * Ex: Creator royality is 5% or 0.05, which is 500bps we need to pass
    * feeNumerator = 10,000 * 0.05 (creator royaltity )
    * With DEFAULT_ADMIN_ROLE able to modify
    */
    function setDefaultRoyality(address reciever, uint96 feeNumerator) public  onlyOwner {
          _setDefaultRoyalty(reciever, feeNumerator);
    }

    // override functions
    function _beforeTokenTransfer(address from, address to, uint256 firstTokenId, uint256 batchSize) internal override (ERC721, ERC721Enumerable, ERC721Pausable) {
        return super._beforeTokenTransfer(from, to, firstTokenId, batchSize);
    }

    function _burn(uint256 tokenId) internal override (ERC721, ERC721URIStorage, ERC721Royalty){
        super._burn(tokenId);
    }
    function tokenURI(uint256 tokenId) public  view override (ERC721, ERC721URIStorage) returns(string memory){
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override (ERC721, ERC721URIStorage, ERC721Enumerable, ERC721Royalty) returns (bool){
        return super.supportsInterface(interfaceId);
    }

}