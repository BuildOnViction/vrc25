# VRC25 Specifications

## Requirement

For a contract to meet TRC25 requirements, it must satisfy the following conditions:

* Implement `IVRC25` interface in the specification.
* Have 3 first storage slots in the contracts as follow:&#x20;

```solidity
mapping (address => uint256) private _balances;
uint256 private _minFee;
address private _owner;
```

* Implement `Permit` extension, as defined in EIP-2612. Permit acts as a fallback for any gas-less protocol to support your token properly, in the case that your token isn't registered for [TomoZ](../integration/tomoz-integration.md).

```solidity
interface IVRC25Permit {
    function nonces(address owner) external view returns (uint256);
    function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s) external;
}
```

{% hint style="info" %}
It's recommended to use "name" and "version" parameters of EIP712 with "VRC25" and "1" respectively for dapps to integrate Permit with your token easier.
{% endhint %}

## Integration

For token contract, please use `VRC25Permit` as your first inherit in your contracts. Permit is required as an alternative for any gas-less protocol to support your token in case you opt-out TomoZ.

For protocol contract, please use `VRC25` as your first inherit in your contracts.
