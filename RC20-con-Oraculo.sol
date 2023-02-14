// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Oraculo.sol";

contract RC20ConOraculo is ERC20, Oraculo{
uint256 tokenPrice = 0.01 ether;
//address owner,
    constructor () ERC20("BlockdemyCoin", "BLC") {
        uint256 initialSupply = 1000;
       // owner = msg.sender;
        _mint(address(this), initialSupply*10**18);
    }
        function sellToken( address _to, uint256 _amount) public payable returns (bool sucess){
        
        uint256 tokenPriceTotal = (tokenPrice*getCost())*_amount;
        require (msg.value >= (tokenPriceTotal), " No tienes fondos suficientes");
        _transfer(address(this), _to, _amount);

        return true;
    }
    

    //Precio del ether en usd
    function getCost() public view returns(uint){
        int price = getLatestPrice();
        
        return uint256(price);
    }

}

