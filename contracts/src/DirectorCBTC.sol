// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/access/Ownable.sol";

contract DirectorCBTC is Ownable {
    struct dataProvider {
        string companyName;
        bool isActive;
        uint256 apy;
    }

    mapping(address user => mapping(uint256 id => uint256)) balances;

    dataProvider[] dataProviders;

    constructor(address initialOwner) Ownable(initialOwner) {}

    function makeProvider(
        string memory companyName,
        uint256 apy
    ) public onlyOwner {
        dataProviders.push(
            dataProvider({companyName: companyName, isActive: true, apy: apy})
        );
    }

    function deactivateProvider(uint256 providerIndex) public onlyOwner {
        dataProviders[providerIndex].isActive = false;
    }

    function addLiquidity(uint256 providerIndex) public payable {
        if (!dataProviders[providerIndex].isActive)
            revert("Provider is not active");

        if (msg.value == 0) revert("No value sent");

        balances[msg.sender][providerIndex] += msg.value;
    }

    function withdrawLiquidity(uint256 amount, uint256 providerIndex) public {
        if (!dataProviders[providerIndex].isActive)
            revert("Provider is not active");

        if (balances[msg.sender][providerIndex] < amount)
            revert("Insufficient balance");

        balances[msg.sender][providerIndex] -= amount;

        payable(msg.sender).transfer(amount);
    }

    function getProvider(
        uint256 providerIndex
    ) public view returns (dataProvider memory) {
        return dataProviders[providerIndex];
    }

    function getAllProviders() public view returns (dataProvider[] memory) {
        return dataProviders;
    }

    function getBalance(
        address user,
        uint256 provider
    ) public view returns (uint256) {
        return balances[user][provider];
    }

    receive() external payable {}

    fallback() external payable {}
}
