// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Provider.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Director is Ownable {
    struct dataProvider {
        string companyName;
        bool isActive;
        uint256 apy;
        address providerContract;
    }

    dataProvider[] public dataProviders;

    constructor(address initialOwner) Ownable(initialOwner) {}

    function makeProvider(
        string memory companyName,
        uint256 apy
    ) public onlyOwner {
        dataProviders.push(
            dataProvider({
                companyName: companyName,
                isActive: true,
                apy: apy,
                providerContract: address(new Provider(msg.sender))
            })
        );
    }

    function deactivateProvider(uint256 providerIndex) public onlyOwner {
        dataProviders[providerIndex].isActive = false;
    }

    function addLiquidity(
        address token,
        uint256 amount,
        uint256 providerIndex
    ) public {
        if (!dataProviders[providerIndex].isActive) {
            revert("Provider is not active");
        }
        IERC20(token).transferFrom(
            msg.sender,
            dataProviders[providerIndex].providerContract,
            amount
        );
    }

    function withdrawLiquidity(
        address token,
        uint256 amount,
        uint256 providerIndex
    ) public {
        if (!dataProviders[providerIndex].isActive) {
            revert("Provider is not active");
        }
        Provider(dataProviders[providerIndex].providerContract)
            .withdrawLiquidity(token, amount, msg.sender);
    }
}
