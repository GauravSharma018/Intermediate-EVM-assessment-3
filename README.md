# Intermediate-EVM-assessment-3
This program is a simple contract written in Solidity. The smart contract creates a new ERC20 contract. Only the contract owner is able to mint tokens to a provided address and any user is able to burn and transfer tokens.

# Description
A basic ERC-20 token contract named BlackAdamToken, built on the ERC20 contract from OpenZeppelin library. The contract inherits from the ERC-20 standard, providing functionalities for a standard fungible token.

ERC-20 Details:
Symbol: MTK
Name: MyToken
Decimals: 18

# Getting Started
Familiar with Remix IDE: It is easy to write, compile and deploy your smart contract if you are already familiar with the Remix IDE.
Understanding of Solidity: It is important to have a strong understanding of Solidity as it is the main programming language used for creating smart contracts in this codebase.

## Installing
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

## Executing te Program
Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the code from contract.sol file into your file:

```ruby
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
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
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to latest solidity version (or another compatible version), and then click on the "Compile" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the your contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the mint() and burn() functions.

# Author
Gaurav Sharma

# Licence
This project is licensed under the MIT License.
