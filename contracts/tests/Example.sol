// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

import "../TRC25.sol";

contract Coin98VRC25 is TRC25 {
    using Address for address;
    event Hello(address sender);

    constructor() TRC25("Terry Fan Token", "TFT", 0) {
    }

    /**
     * @notice Calculate fee required for action related to this token
     * @param value Amount of fee
     */
    function _estimateFee(uint256 value) internal view override returns (uint256) {
        return value + minFee();
    }

    function sayHello() public {
        _chargeFeeFrom(msg.sender, address(0), estimateFee(0));

        emit Hello(msg.sender);
    }

    function supportsInterface(bytes4 interfaceId) public pure override returns (bool) {
        return interfaceId == type(ITRC25).interfaceId || super.supportsInterface(interfaceId);
    }
}
