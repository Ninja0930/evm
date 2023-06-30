# RMRKERC20HolderMock

*RMRK team*

> RMRKERC20HolderMock

Smart contract of the RMRK ERC20 Holder module.



## Methods

### approve

```solidity
function approve(address to, uint256 tokenId) external nonpayable
```



*See {IERC721-approve}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| tokenId | uint256 | undefined |

### balanceOf

```solidity
function balanceOf(address owner) external view returns (uint256)
```



*See {IERC721-balanceOf}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### balanceOfERC20

```solidity
function balanceOfERC20(address erc20Contract, uint256 tokenId) external view returns (uint256)
```

Used to retrieve the given token&#39;s specific ERC-20 balance



#### Parameters

| Name | Type | Description |
|---|---|---|
| erc20Contract | address | The address of the ERC-20 smart contract |
| tokenId | uint256 | The ID of the token being checked for ERC-20 balance |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The amount of the specified ERC-20 tokens owned by a given token |

### getApproved

```solidity
function getApproved(uint256 tokenId) external view returns (address)
```



*See {IERC721-getApproved}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### isApprovedForAll

```solidity
function isApprovedForAll(address owner, address operator) external view returns (bool)
```



*See {IERC721-isApprovedForAll}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| operator | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### mint

```solidity
function mint(address to, uint256 tokenId) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| tokenId | uint256 | undefined |

### name

```solidity
function name() external view returns (string)
```



*See {IERC721Metadata-name}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### ownerOf

```solidity
function ownerOf(uint256 tokenId) external view returns (address)
```



*See {IERC721-ownerOf}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId) external nonpayable
```



*See {IERC721-safeTransferFrom}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| tokenId | uint256 | undefined |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId, bytes data) external nonpayable
```



*See {IERC721-safeTransferFrom}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| tokenId | uint256 | undefined |
| data | bytes | undefined |

### setApprovalForAll

```solidity
function setApprovalForAll(address operator, bool approved) external nonpayable
```



*See {IERC721-setApprovalForAll}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| operator | address | undefined |
| approved | bool | undefined |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| interfaceId | bytes4 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```



*See {IERC721Metadata-symbol}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### tokenURI

```solidity
function tokenURI(uint256 tokenId) external view returns (string)
```



*See {IERC721Metadata-tokenURI}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### transferERC20BetweenTokens

```solidity
function transferERC20BetweenTokens(address erc20Contract, uint256 fromTokenId, uint256 toTokenId, uint256 value, bytes data) external nonpayable
```

Transfer ERC-20 tokens from one token to another one within the same collection.

*ERC-20 tokens are only transferred internally; they never leave this smart contract.Implementers should validate that the `msg.sender` is either the token owner or approved to manage the `fromTokenId` before calling this.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| erc20Contract | address | The address of the ERC-20 smart contract |
| fromTokenId | uint256 | undefined |
| toTokenId | uint256 | The ID of the token to transfer ERC-20 tokens to |
| value | uint256 | undefined |
| data | bytes | Additional data with no specified format, to allow for custom logic |

### transferERC20FromToken

```solidity
function transferERC20FromToken(address erc20Contract, uint256 tokenId, address to, uint256 value, bytes data) external nonpayable
```

Transfer ERC-20 tokens from a specific token.

*The balance MUST be transferred from this smart contract.Implementers should validate that the `msg.sender` is either the token owner or approved to manage it before calling this.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| erc20Contract | address | The address of the ERC-20 smart contract |
| tokenId | uint256 | The ID of the token to transfer the ERC-20 tokens from |
| to | address | undefined |
| value | uint256 | undefined |
| data | bytes | Additional data with no specified format, to allow for custom logic |

### transferERC20ToToken

```solidity
function transferERC20ToToken(address erc20Contract, uint256 tokenId, uint256 amount, bytes data) external nonpayable
```

Transfer ERC-20 tokens to a specific token.

*The ERC-20 smart contract must have approval for this contract to transfer the ERC-20 tokens.The balance MUST be transferred from the `msg.sender`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| erc20Contract | address | The address of the ERC-20 smart contract |
| tokenId | uint256 | The ID of the token to transfer ERC-20 tokens to |
| amount | uint256 | The number of ERC-20 tokens to transfer |
| data | bytes | Additional data with no specified format, to allow for custom logic |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 tokenId) external nonpayable
```



*See {IERC721-transferFrom}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| tokenId | uint256 | undefined |



## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId)
```



*Emitted when `owner` enables `approved` to manage the `tokenId` token.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| approved `indexed` | address | undefined |
| tokenId `indexed` | uint256 | undefined |

### ApprovalForAll

```solidity
event ApprovalForAll(address indexed owner, address indexed operator, bool approved)
```



*Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| operator `indexed` | address | undefined |
| approved  | bool | undefined |

### ReceivedERC20

```solidity
event ReceivedERC20(address indexed erc20Contract, uint256 indexed toTokenId, address indexed from, uint256 amount)
```

Used to notify listeners that the token received ERC-20 tokens.



#### Parameters

| Name | Type | Description |
|---|---|---|
| erc20Contract `indexed` | address | The address of the ERC-20 smart contract |
| toTokenId `indexed` | uint256 | The ID of the token receiving the ERC-20 tokens |
| from `indexed` | address | The address of the account from which the tokens are being transferred |
| amount  | uint256 | The number of ERC-20 tokens received |

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 indexed tokenId)
```



*Emitted when `tokenId` token is transferred from `from` to `to`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| tokenId `indexed` | uint256 | undefined |

### TransferredERC20

```solidity
event TransferredERC20(address indexed erc20Contract, uint256 indexed fromTokenId, address indexed to, uint256 amount)
```

Used to notify the listeners that the ERC-20 tokens have been transferred.



#### Parameters

| Name | Type | Description |
|---|---|---|
| erc20Contract `indexed` | address | The address of the ERC-20 smart contract |
| fromTokenId `indexed` | uint256 | The ID of the token from which the ERC-20 tokens have been transferred |
| to `indexed` | address | The address receiving the ERC-20 tokens |
| amount  | uint256 | The number of ERC-20 tokens transferred |



## Errors

### InsufficientBalance

```solidity
error InsufficientBalance()
```






### InvalidAddress

```solidity
error InvalidAddress()
```






### InvalidValue

```solidity
error InvalidValue()
```






### OnlyNFTOwnerCanTransferTokensFromIt

```solidity
error OnlyNFTOwnerCanTransferTokensFromIt()
```







