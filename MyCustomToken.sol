// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyCustomToken is ERC20 {
    address public owner;
    constructor() ERC20("MyToken", "MTK") {
        owner = msg.sender;
        _mint(address(this), 1000 );
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only Owner can perform this operation.");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner{
        uint bal = balanceOf(address(this));
        require(bal >= amount, "INSUFFICIENT BALANCE!");
        _transfer(address(this), to, amount);
    }

    function burn(uint256 value) public {
         _burn(msg.sender, value);
    }
}
