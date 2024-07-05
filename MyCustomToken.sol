// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MyCustomToken is ERC20 {
    address public owner;
    constructor() ERC20("MyCustomToken", "MTK") {
        owner = msg.sender;
    }

    //mint the token to an address
    function mintToken(address to, uint256 amount) public {
        require(msg.sender == owner, "Only Owner can perform this operation.");
        _mint(to, amount);
    }

    //transfer the tokens to an address from the account you own
    function transferToken(address to, uint256 amount) public {
        _transfer(msg.sender, to, amount);
    }

     //burn the tokens from the account you own
    function burnToken(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
