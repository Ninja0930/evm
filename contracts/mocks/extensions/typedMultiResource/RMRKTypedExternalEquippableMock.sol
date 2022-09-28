// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.15;

import "../../../RMRK/extension/typedMultiResource/RMRKTypedExternalEquippable.sol";
import "../../RMRKExternalEquipMock.sol";

error RMRKTokenHasNoResourcesWithType();

abstract contract RMRKTypedExternalEquippableMock is
    RMRKExternalEquipMock,
    RMRKTypedExternalEquippable
{
    constructor(address nestingAddress) RMRKExternalEquipMock(nestingAddress) {}

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(RMRKExternalEquip, RMRKTypedExternalEquippable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function addTypedResourceEntry(
        ExtendedResource memory resource,
        uint64[] calldata fixedPartIds,
        uint64[] calldata slotPartIds,
        string memory type_
    ) external {
        _addResourceEntry(resource, fixedPartIds, slotPartIds);
        _setResourceType(resource.id, type_);
    }
}
