pragma solidity ^0.7.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/math/SafeMath.sol";

contract SolLibraries {
    
    using SafeMath for uint;
    
    address owner;
    
    mapping(address => uint) tokenBalance;
    
    constructor () {
        owner = msg.sender;
        tokenBalance[owner] = 100;
    }
    
    function sendToken(address _to, uint _amount) public returns(bool) {
        // require(tokenBalance[msg.sender] >= _amount, "You don't have enough funds");
        // assert((tokenBalance[_to] + _amount) >= tokenBalance[_to]);
        // assert((tokenBalance[msg.sender] - _amount) <= tokenBalance[msg.sender]);
        // tokenBalance[msg.sender] -= _amount;
        // tokenBalance[_to] += _amount;
        
        // Using the .add and .sub functions from the SafeMath library we get an error thrown when trying to make this transaction
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to] = tokenBalance[_to].add(_amount);
        return true;
    }
}