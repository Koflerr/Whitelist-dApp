//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses; // Max number of whitelisted addresses allowed

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted; //  to keep track of how many addresses have been whitelisted

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addresses cant be added, limit reached"
        );
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
