// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyCustomToken is ERC20 {
    address public owner;
    
    constructor() ERC20("MyCustomToken", "MTK") {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only Owner can perform this operation.");
        _;
    }

    function mintToken(address to, uint256 amount) public onlyOwner{
        uint bal = balanceOf(msg.sender);
        require(bal >= amount, "INSUFFICIENT BALANCE!");
         _mint(to, amount);
    }

    function transferToken(address to, uint256 amount) public {
         _transfer(msg.sender, to, amount);
    }

    function burnToken(uint256 amount) public {
         _burn(msg.sender, amount);
    }

}


