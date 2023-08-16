// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

import "./TRC25.sol";

contract Example is TRC25 {
    event Hello(address sender);

    constructor() TRC25("Terry Fan Token", "TFT", 0) {
    }

    /**
     * @notice Calculate fee required for action related to this token
     * @param value Amount of fee
     */
    function estimateFee(uint256 value) public view override returns (uint256) {
        return value + minFee();
    }

    function sayHello() public {
        uint256 fee = estimateFee(0);
        _chargeFeeFrom(msg.sender, address(0), fee);

        emit Hello(msg.sender);
    }
}
