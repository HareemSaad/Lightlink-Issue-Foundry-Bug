// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.21;

interface IERC20 {
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

contract CommonUtils {
    struct Data {
        uint nonce;
        IERC20 sellToken;
        IERC20 buyToken;
        address receiver;
        address maker;
        address operator;
    }

    // encode order function
    function encodeOrder(Data memory self) external pure returns (bytes memory) {
        return abi.encode(self);
    }

    // decode order function
    function decodeOrder(bytes memory data) external pure returns (Data memory) {
        return abi.decode(data, (Data));
    }
}