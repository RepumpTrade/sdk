// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RepumpToken {

    string public name;
    string public symbol;
    uint256 public totalSupply;

    address public owner;

    mapping(address => uint256) public balances;

    address[] public feeWallets;
    uint256 public feePercent = 5;

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _supply,
        address[] memory _wallets
    ) {
        require(_wallets.length <= 10, "Max 10 wallets");

        name = _name;
        symbol = _symbol;
        totalSupply = _supply;
        owner = msg.sender;

        balances[msg.sender] = _supply;

        feeWallets = _wallets;
    }

    function transfer(address to, uint256 amount) public {

        require(balances[msg.sender] >= amount, "Not enough balance");

        uint256 fee = (amount * feePercent) / 100;
        uint256 sendAmount = amount - fee;

        balances[msg.sender] -= amount;
        balances[to] += sendAmount;

        uint256 split = fee / feeWallets.length;

        for (uint i = 0; i < feeWallets.length; i++) {
            balances[feeWallets[i]] += split;
        }
    }
}
