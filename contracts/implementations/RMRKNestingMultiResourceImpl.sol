// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.15;

import "../RMRK/access/OwnableLock.sol";
import "../RMRK/utils/RMRKMintingUtils.sol";
import "../RMRK/RMRKNestingMultiResource.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

error RMRKMintUnderpriced();
error RMRKMintZero();

//Minimal public implementation of IRMRKNesting for testing.
contract RMRKNestingMultiResourceImpl is OwnableLock, RMRKMintingUtils, RMRKNestingMultiResource {
    using Strings for uint256;

    // Manage resources via increment
    uint256 private _totalResources;

    //Mapping of uint64 resource ID to tokenEnumeratedResource for tokenURI
    mapping(uint64 => bool) internal _tokenEnumeratedResource;

    //fallback URI
    string internal _fallbackURI;

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 maxSupply_,
        uint256 pricePerMint_
    )
    RMRKNestingMultiResource(name_, symbol_)
    RMRKMintingUtils(maxSupply_, pricePerMint_)
    {}

    /*
    Template minting logic
    */
    function mint(address to, uint256 numToMint) external payable saleIsOpen {
        (uint nextToken, uint totalSupplyOffset) = _preMint(numToMint);

        for(uint i = nextToken; i < totalSupplyOffset;) {
            _safeMint(to, i);
            unchecked {++i;}
        }
    }

    /*
    Template minting logic
    */
    function mintNesting(address to, uint256 numToMint, uint256 destinationId) external payable saleIsOpen {
        (uint nextToken, uint totalSupplyOffset) = _preMint(numToMint);

        for(uint i = nextToken; i < totalSupplyOffset;) {
            _nestMint(to, i, destinationId);
            unchecked {++i;}
        }
    }

    function _preMint(uint256 numToMint) private returns(uint, uint) {
        if (numToMint == uint256(0)) revert RMRKMintZero();
        if (numToMint + _totalSupply > _maxSupply) revert RMRKMintOverMax();

        uint256 mintPriceRequired = numToMint * _pricePerMint;
        if (mintPriceRequired != msg.value)
            revert RMRKMintUnderpriced();

        uint256 nextToken = _totalSupply+1;
        _totalSupply += numToMint;
        uint256 totalSupplyOffset = _totalSupply+1;

        return (nextToken, totalSupplyOffset);
    }

    //update for reentrancy
    function burn(uint256 tokenId) public onlyApprovedOrDirectOwner(tokenId) {
        _burn(tokenId);
    }

    function isApprovedOrOwner(address spender, uint256 tokenId) external view returns (bool) {
        return _isApprovedOrOwner(spender, tokenId);
    }

    function getFallbackURI() external view virtual returns (string memory) {
        return _fallbackURI;
    }

    function setFallbackURI(string memory fallbackURI) external onlyOwner {
        _fallbackURI = fallbackURI;
    }

    function isTokenEnumeratedResource(
        uint64 resourceId
    ) public view virtual returns(bool) {
        return _tokenEnumeratedResource[resourceId];
    }

    function setTokenEnumeratedResource(
        uint64 resourceId,
        bool state
    ) external onlyOwner {
        _tokenEnumeratedResource[resourceId] = state;
    }

    function addResourceToToken(
        uint256 tokenId,
        uint64 resourceId,
        uint64 overwrites
    ) external {
        if(ownerOf(tokenId) == address(0))
            revert ERC721InvalidTokenId();
        _addResourceToToken(tokenId, resourceId, overwrites);
    }

    function addResourceEntry(string memory metadataURI) external onlyOwner {
        unchecked {_totalResources += 1;}
        _addResourceEntry(uint64(_totalResources), metadataURI);
    }

    function totalResources() external view returns(uint256) {
        return _totalResources;
    }

    function transfer(
        address to,
        uint256 tokenId
    ) public virtual {
        transferFrom(_msgSender(), to, tokenId);
    }

    function nestTransfer(
        address to,
        uint256 tokenId,
        uint256 destinationId
    ) public virtual {
        nestTransferFrom(_msgSender(), to, tokenId, destinationId);
    }

    function _tokenURIAtIndex(
        uint256 tokenId,
        uint256 index
    ) internal override view returns (string memory) {
        _requireMinted(tokenId);
        if (_activeResources[tokenId].length > index)  {
            uint64 activeResId = _activeResources[tokenId][index];
            Resource memory _activeRes = getResource(activeResId);
            string memory uri = string(
                abi.encodePacked(
                    _baseURI(),
                    _activeRes.metadataURI,
                    _tokenEnumeratedResource[activeResId] ? tokenId.toString() : ""
                )
            );

            return uri;
        }
        else {
            return _fallbackURI;
        }
    }
}
